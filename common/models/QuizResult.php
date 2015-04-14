<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.QUIZ_RESULT".
 *
 * @property integer $Result_ID
 * @property integer $Quiz_ID
 * @property string $Classification_result
 * @property string $Result_text
 *
 * @property HISTORY[] $hISTORies
 */
class QuizResult extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.QUIZ_RESULT';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Quiz_ID', 'Classification_result', 'Result_text'], 'required'],
            [['Quiz_ID'], 'integer'],
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
            'Classification_result' => 'Hasil klasifikasi',
            'Result_text' => 'Hasil',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHISTORies()
    {
        return $this->hasMany(HISTORY::className(), ['Result_ID' => 'Result_ID']);
    }
}
