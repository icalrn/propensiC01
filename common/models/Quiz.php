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

    public $question_field;
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
            [['Title'], 'string', 'max' => 50],
            [['question_field'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Quiz_ID' => 'Quiz ID',
            'Title' => 'Nama Kuesioner',
            'Description' => 'Deskripsi',
            'question_field' => 'Daftar Pertanyaan :'
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
        return $this->hasMany(QUESTION::className(), ['Question_ID' => 'Question_ID'])->viaTable('propensi.QUIZ_CONTENT', ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQUIZRESULTs()
    {
        return $this->hasMany(QUIZRESULT::className(), ['Quiz_ID' => 'Quiz_ID']);
    }

    public function afterSave($insert, $changedAttributes){
        Yii::$app->db->createCommand()->delete('propensi.QUIZ_CONTENT', '"Quiz_ID" = '.(int) $this->Quiz_ID)->execute(); //Delete existing value
        foreach ($this->question_field as $id) { //Write new values
            $tc = new QuizContent();
            $tc->Quiz_ID = $this->Quiz_ID;
            $tc->Question_ID = $id;
            $tc->save();
        }
    }
}
