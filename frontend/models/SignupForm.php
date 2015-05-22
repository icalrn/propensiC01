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
	public $repeat_password;
	

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required', 'message' => 'Username tidak boleh kosong'],
            ['username', 'unique', 'targetClass' => '\common\models\User', 'message' => 'Username telah digunakan'],
            ['username', 'string', 'min' => 2, 'max' => 255, 'message' => 'Panjang username tidak boleh kurang dari 2 karakter dan lebih dari 255 karakter'],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required', 'message' => 'Email tidak boleh kosong'],
            ['email', 'email', 'message' => 'Alamat email tidak valid'],
            ['email', 'unique', 'targetClass' => '\common\models\User', 'message' => 'Alamat email ini telah terpakai'],

            ['password', 'required', 'message' => 'Password tidak boleh kosong'],
            ['password', 'string', 'min' => 6, 'message' => 'Panjang password tidak boleh kurang dari 6 karakter'],
            ['repeat_password', 'compare', 'compareAttribute'=>'password', 'message'=>'Password tidak sama'],
            ['repeat_password', 'required', 'message' => 'Password tidak boleh kosong'],
			
			['place_of_birth', 'filter', 'filter' => 'trim'],
            ['place_of_birth', 'string', 'max' => 30, 'message' => 'Panjang tempat lahir tidak boleh lebih dari 30 karakter'],
			
			['date_of_birth', 'filter', 'filter' => 'trim'],
            ['date_of_birth', 'date', 'format' => 'yyyy-M-d', 'message' => 'Tanggal lahir dengan format yyyy-M-d'],
			
			['address', 'filter', 'filter' => 'trim'],
            ['address', 'string', 'max' => 50, 'message' => 'Panjang alamat tidak boleh lebih dari 50 karakter'],

            ['gender', 'filter', 'filter' => 'trim'],
            ['gender', 'string', 'max' => 6],
			
			['education', 'filter', 'filter' => 'trim'],
            ['education', 'string', 'max' => 4],
			
			['phone', 'filter', 'filter' => 'trim'],
            ['phone', 'integer', 'max' => 12, 'message' => 'Nomor telepon harus berupa angka dan tidak boleh lebih dari 12 karakter'],
			
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
			$user->role = '10';
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
