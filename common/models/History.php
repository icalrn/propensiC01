<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.HISTORY".
 *
 * @property integer $User_ID
 * @property string $Timestamp
 * @property integer $Quiz_ID
 * @property integer $Result_ID
 */
class History extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.HISTORY';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['User_ID', 'Timestamp', 'Quiz_ID'], 'required'],
            [['User_ID', 'Quiz_ID', 'Result_ID'], 'integer'],
            [['Timestamp'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'User_ID' => 'User  ID',
            'Timestamp' => 'Waktu',
            'Quiz_ID' => 'Quiz  ID',
            'Result_ID' => 'Result  ID',
        ];
    }
	public function getQuiz()
    {
        return $this->hasOne(QUIZ::className(), ['Quiz_ID' => 'Quiz_ID']);
    }
	
	public function getResult()
    {
        return $this->hasOne(QUIZRESULT::className(), ['Result_ID' => 'Result_ID']);
    }
	
	public function getUser()
    {
        return $this->hasOne(user::className(), ['id' => 'User_ID']);
    }
}
