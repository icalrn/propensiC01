<?php
namespace frontend\models;

use common\models\User;
use yii\base\Model;
use Yii;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
	public $date_of_birth;
	public $place_of_birth;
	public $address;
	public $gender;
	public $phone;
	public $education;
	public $occupation;
	

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This email address has already been taken.'],

            ['password', 'required'],
            ['password', 'string', 'min' => 6],
			
			['place_of_birth', 'filter', 'filter' => 'trim'],
            ['place_of_birth', 'string', 'max' => 30],
			
			['date_of_birth', 'filter', 'filter' => 'trim'],
            ['date_of_birth', 'string', 'max' => 10],
			
			['address', 'filter', 'filter' => 'trim'],
            ['address', 'string', 'max' => 50],
			
			['phone', 'filter', 'filter' => 'trim'],
            ['phone', 'string', 'max' => 13],
			
			['occupation', 'filter', 'filter' => 'trim'],
            ['occupation', 'string', 'max' => 30],
            
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
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if ($this->validate()) {
            $user = new User();
            $user->username = $this->username;
            $user->email = $this->email;
            $user->setPassword($this->password);
			$user->role = 'u';
			$user->date_of_birth = $this->date_of_birth;
			$user->place_of_birth = $this->place_of_birth;
			$user->address = $this->address;
			if ($this->gender == 0)
				$user->gender = 'Pria';
			else $userl->gender = 'Wanita';
			$user->phone = $this->phone;
			
			switch ($this->education) 
			{
				case "0":
					$user->education = "SD";
					break;
				case "1":
					$user->education = "SMP";
					break;
				case "2":
					$user->education = "SMA";
					break;
				case "3":
					$user->education = "D3";
					break;
				case "4":
					$user->education = "S1";
					break;
				case "5":
					$user->education = "S2";
					break;
				case "6":
					$user->education = "S3";
					break;
			}
			
			$user->occupation = $this->occupation;
			
            $user->generateAuthKey();
            if ($user->save()) {
                return $user;
            }
        }

        return null;
    }
}
