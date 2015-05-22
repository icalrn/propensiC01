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
    public $category_field;
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
            [['Question_text'], 'required', 'message' => 'Pertanyaan tidak boleh kosong'],
            [['Weight'], 'integer', 'message' => 'Bobot harus berupa angka'],
            [['Question_text'], 'string', 'max' => 100, 'message' => 'Panjang pertanyaan tidak boleh lebih dari 100 karakter'],
            [['category_field'], 'safe'],
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
            'category_field' => 'Daftar Kategori :',
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
        return $this->hasMany(CATEGORY::className(), ['Category_ID' => 'Category_ID'])->viaTable('propensi.QUEST_CATEGORY', ['Question_ID' => 'Question_ID']);
    }

    public function afterSave($insert, $changedAttributes){
        Yii::$app->db->createCommand()->delete('propensi.QUEST_CATEGORY', '"Question_ID" = '.(int) $this->Question_ID)->execute();
        if ($this->category_field!=NULL){
            foreach ($this->category_field as $id) {
                $tc = new QuestCategory();
                $tc->Question_ID = $this->Question_ID;
                $tc->Category_ID = $id;
                $tc->save();
            }
        }
    }
}
