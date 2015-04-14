<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.QUESTION".
 *
 * @property integer $Question_ID
 * @property string $Question_text
 * @property integer $Weight
 * @property integer $Category_ID
 *
 * @property ANSWER[] $aNSWERs
 * @property QUIZCONTENT[] $qUIZCONTENTs
 * @property QUIZ[] $quizzes
 */
class Question extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.QUESTION';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Question_text', 'Category_ID'], 'required'],
            [['Weight', 'Category_ID'], 'integer'],
            [['Question_text'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Question_ID' => 'Question  ID',
            'Question_text' => 'Pertanyaan',
            'Weight' => 'Bobot',
            'Category_ID' => 'Category  ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getANSWERs()
    {
        return $this->hasMany(ANSWER::className(), ['Question_ID' => 'Question_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    /*public function getQUIZCONTENTs()
    {
        return $this->hasMany(QUIZCONTENT::className(), ['Question_ID' => 'Question_ID']);
    }*/

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuizzes()
    {
        return $this->hasMany(QUIZ::className(), ['Quiz_ID' => 'Quiz_ID'])->viaTable('QUIZ_CONTENT', ['Question_ID' => 'Question_ID']);
    }

    public function getCategory()
    {
        return $this->hasOne(CATEGORY::className(),['Category_ID' => 'Category_ID']);
    }
}
