<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.QUIZ".
 *
 * @property integer $Quiz_ID
 * @property string $Title
 * @property string $Description
 *
 * @property HISTORY[] $hISTORies
 * @property ANSWER[] $aNSWERs
 * @property QUIZCONTENT[] $qUIZCONTENTs
 * @property QUESTION[] $questions
 * @property QUIZRESULT[] $qUIZRESULTs
 */
class Quiz extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.QUIZ';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Title', 'Description'], 'required'],
            [['Description'], 'string'],
            [['Title'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Quiz_ID' => 'Quiz  ID',
            'Title' => 'Title',
            'Description' => 'Description',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHISTORies()
    {
        return $this->hasMany(HISTORY::className(), ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getANSWERs()
    {
        return $this->hasMany(ANSWER::className(), ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQUIZCONTENTs()
    {
        return $this->hasMany(QUIZCONTENT::className(), ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuestions()
    {
        return $this->hasMany(QUESTION::className(), ['Question_ID' => 'Question_ID'])->viaTable('QUIZ_CONTENT', ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQUIZRESULTs()
    {
        return $this->hasMany(QUIZRESULT::className(), ['Quiz_ID' => 'Quiz_ID']);
    }
}
