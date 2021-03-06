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
            [['Classification_result'], 'required', 'message' => 'Hasil klasifikasi tidak boleh kosong'],
            [['Quiz_ID'], 'required', 'message' => 'Kuis tidak boleh kosong'],
            [['Result_text'], 'required', 'message' => 'Keterangan tidak boleh kosong'],
            [['Quiz_ID'], 'integer'],
            [['Result_text'], 'string'],
            [['Classification_result'], 'string', 'max' => 20, 'message' => 'Panjang hasil klasifikasi tidak boleh lebih dari 20 karakter']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Result_ID' => 'Result  ID',
            'Quiz_ID' => 'Kuesioner',
            'Classification_result' => 'Hasil klasifikasi',
            'Result_text' => 'Keterangan',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHISTORies()
    {
        return $this->hasMany(HISTORY::className(), ['Result_ID' => 'Result_ID']);
    }

    public function getQuiz()
    {
        return $this->hasOne(QUIZ::className(), ['Quiz_ID' => 'Quiz_ID']);
    }
}
