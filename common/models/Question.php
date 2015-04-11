<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "question".
 *
 * @property integer $Question_ID
 * @property string $Question_text
 * @property integer $Weight
 * @property string $Category_text
 *
 * @property Answer[] $answers
 * @property Category $categoryText
 * @property QuizContent[] $quizContents
 * @property Quiz[] $quizzes
 */
class Question extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'question';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Question_text', 'Category_text'], 'required'],
            [['Weight'], 'integer'],
            [['Question_text'], 'string', 'max' => 100],
            [['Category_text'], 'string', 'max' => 20]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Question_ID' => 'Question  ID',
            'Question_text' => 'Question Text',
            'Weight' => 'Weight',
            'Category_text' => 'Category Text',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAnswers()
    {
        return $this->hasMany(Answer::className(), ['Question_ID' => 'Question_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategoryText()
    {
        return $this->hasOne(Category::className(), ['Category_text' => 'Category_text']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuizContents()
    {
        return $this->hasMany(QuizContent::className(), ['Question_ID' => 'Question_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuizzes()
    {
        return $this->hasMany(Quiz::className(), ['Quiz_ID' => 'Quiz_ID'])->viaTable('quiz_content', ['Question_ID' => 'Question_ID']);
    }
}
