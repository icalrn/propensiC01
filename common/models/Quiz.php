<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.QUIZ".
 *
 * @property integer $Quiz_ID
 * @property string $Title
 * @property string $Description
 * @property integer $flag
 *
 * @property QUIZRESULT[] $qUIZRESULTs
 * @property QUIZCONTENT[] $qUIZCONTENTs
 * @property QUESTION[] $questions
 * @property HISTORY[] $hISTORies
 * @property ANSWER[] $aNSWERs
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
            [['Title'], 'required', 'message' => 'Judul tidak boleh kosong'],
            [['Description'], 'required', 'message' => 'Deskripsi tidak boleh kosong'],
            [['Description'], 'string'],
            [['flag'], 'integer'],
            [['Title'], 'string', 'max' => 50, 'message' => 'Panjang judul tidak boleh lebh dari 50 karakter'],
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
            'question_field' => 'Daftar Pertanyaan :',
            'flag' => 'Status Deploy:',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQUIZRESULTs()
    {
        return $this->hasMany(QUIZRESULT::className(), ['Quiz_ID' => 'Quiz_ID']);
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
	
	public function afterSave($insert, $changedAttributes){
        Yii::$app->db->createCommand()->delete('propensi.QUIZ_CONTENT', '"Quiz_ID" = '.(int) $this->Quiz_ID)->execute();
        if ($this->question_field!=NULL){
        foreach ($this->question_field as $id) {
            $question = Question::findOne(['Question_text' => $id]);
            $tc = new QuizContent();
            $tc->Quiz_ID = $this->Quiz_ID;
            $tc->Question_ID = $question->Question_ID;
            $tc->save();
        }
        }
    }
}
