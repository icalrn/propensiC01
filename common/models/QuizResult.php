<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "quiz_result".
 *
 * @property integer $Result_ID
 * @property integer $Quiz_ID
 * @property string $Classification_result
 * @property string $Result_text
 *
 * @property History[] $histories
 * @property Quiz $quiz
 */
class QuizResult extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'quiz_result';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Result_ID', 'Quiz_ID', 'Classification_result', 'Result_text'], 'required'],
            [['Result_ID', 'Quiz_ID'], 'integer'],
            [['Result_text'], 'string'],
            [['Classification_result'], 'string', 'max' => 20]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Result_ID' => 'Result  ID',
            'Quiz_ID' => 'Quiz  ID',
            'Classification_result' => 'Classification Result',
            'Result_text' => 'Result Text',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHistories()
    {
        return $this->hasMany(History::className(), ['Result_ID' => 'Result_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuiz()
    {
        return $this->hasOne(Quiz::className(), ['Quiz_ID' => 'Quiz_ID']);
    }
}
