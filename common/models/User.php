<?php
namespace common\models;

use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

/**
 * User model
 *
 * @property integer $id
 * @property string $username
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email
 * @property string $auth_key
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $password write-only password
 */
class User extends ActiveRecord implements IdentityInterface
{
    const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 10;

    //ROLES
    const ROLE_USER = 10;
    const ROLE_ADMIN = 20;
    const ROLE_BANNED = 30;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.user';
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //RBAC
            ['role', 'default', 'value' => self::ROLE_USER],
            ['role', 'in', 'range' => [self::ROLE_USER, self::ROLE_ADMIN, self::ROLE_BANNED]],

            ['status', 'default', 'value' => self::STATUS_ACTIVE],
            ['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_DELETED]],
			
			['email', 'filter', 'filter' => 'trim'],
            ['email', 'required', 'message' => 'Email tidak boleh kosong'],
            ['email', 'email', 'message' => 'Alamat email tidak valid'],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This email address has already been taken.'],
			
			['place_of_birth', 'filter', 'filter' => 'trim'],
            ['place_of_birth', 'string', 'max' => 30, 'message' => 'Panjang tempat lahir tidak boleh lebih dari 30 karakter'],
			
			['date_of_birth', 'filter', 'filter' => 'trim'],
            ['date_of_birth', 'date', 'format' => 'yyyy-M-d', 'message' => 'Tanggal lahir dengan format yyyy-M-d'],
			
			['address', 'filter', 'filter' => 'trim'],
            ['address', 'string', 'max' => 50, 'message' => 'Panjang alamat tidak boleh lebih dari 50 karakter'],
			
			['phone', 'filter', 'filter' => 'trim'],
            ['phone', 'string', 'max' => 13, 'message' => 'Panjang nomor telepon tidak boleh lebih dari 13 karakter'],
			
			['gender', 'filter', 'filter' => 'trim'],
            ['gender', 'string', 'max' => 6],
			
			['education', 'filter', 'filter' => 'trim'],
            ['education', 'string', 'max' => 4],
			
			['occupation', 'filter', 'filter' => 'trim'],
            ['occupation', 'string', 'max' => 30, 'message' => 'Panjang pekerjaan tidak boleh lebih dari 30 karakter'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'username' => 'Username',
			'place_of_birth' => 'Tempat lahir',
			'date_of_birth' => 'Tanggal lahir',
			'address' => 'Alamat',
			'phone' => 'Nomor telepon',
			'gender' => 'Jenis kelamin',
			'education' => 'Pendidikan terakhir',
			'occupation' => 'Pekerjaan',			
        ];
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'password_reset_token' => $token,
            'status' => self::STATUS_ACTIVE,
        ]);
    }

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return boolean
     */
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        $parts = explode('_', $token);
        $timestamp = (int) end($parts);
        return $timestamp + $expire >= time();
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    public function delete()
    {
        $this->status = 0;
        $this->save();
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }

    public function upgrade()
    {
        $this->role = self::ROLE_ADMIN;
        $this->save();
    }

    public static function isAdmin($id)
    {
        return static::findIdentity($id)->role == self::ROLE_ADMIN? true : false;
    }

    public static function isBanned($id)
    {
        return static::$this->findIdentity($id)->role == self::ROLE_BANNED? true : false;
    }
}
