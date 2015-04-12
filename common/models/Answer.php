<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.ANSWER".
 *
 * @property integer $User_ID
 * @property integer $Quiz_ID
 * @property integer $Question_ID
 * @property string $Timestamp
 * @property string $Answer_text
 * @property string $Subcategory_text
 */
class Answer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.ANSWER';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['User_ID', 'Quiz_ID', 'Question_ID', 'Timestamp', 'Answer_text', 'Subcategory_text'], 'required'],
            [['User_ID', 'Quiz_ID', 'Question_ID'], 'integer'],
            [['Timestamp'], 'safe'],
            [['Answer_text'], 'string'],
            [['Subcategory_text'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'User_ID' => 'User  ID',
            'Quiz_ID' => 'Quiz  ID',
            'Question_ID' => 'Question  ID',
            'Timestamp' => 'Timestamp',
            'Answer_text' => 'Answer Text',
            'Subcategory_text' => 'Subcategory Text',
        ];
    }
}