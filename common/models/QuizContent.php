<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.QUIZ_CONTENT".
 *
 * @property integer $Quiz_ID
 * @property integer $Question_ID
 */
class QuizContent extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.QUIZ_CONTENT';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Quiz_ID', 'Question_ID'], 'required'],
            [['Quiz_ID', 'Question_ID'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Quiz_ID' => 'Quiz  ID',
            'Question_ID' => 'Question  ID',
        ];
    }

    public function getQuiz()
    {
        return $this->hasMany(QUIZ::className(), ['Quiz_ID' => 'Quiz_ID']);
    }
}
