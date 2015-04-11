<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "quiz".
 *
 * @property integer $Quiz_ID
 * @property string $Title
 * @property string $Description
 *
 * @property Answer[] $answers
 * @property History[] $histories
 * @property QuizContent[] $quizContents
 * @property Question[] $questions
 * @property QuizResult[] $quizResults
 */
class Quiz extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'quiz';
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
    public function getAnswers()
    {
        return $this->hasMany(Answer::className(), ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHistories()
    {
        return $this->hasMany(History::className(), ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuizContents()
    {
        return $this->hasMany(QuizContent::className(), ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuestions()
    {
        return $this->hasMany(Question::className(), ['Question_ID' => 'Question_ID'])->viaTable('quiz_content', ['Quiz_ID' => 'Quiz_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuizResults()
    {
        return $this->hasMany(QuizResult::className(), ['Quiz_ID' => 'Quiz_ID']);
    }
}
