<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.TESTIMONY".
 *
 * @property integer $User_ID
 * @property string $Timestamp
 * @property string $Testimony_text
 */
class Testimony extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.TESTIMONY';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['User_ID', 'Timestamp', 'Testimony_text'], 'required'],
            [['User_ID'], 'integer'],
            [['Timestamp'], 'safe'],
            [['Testimony_text'], 'string']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'User_ID' => 'User  ID',
            'Timestamp' => 'Waktu',
            'Testimony_text' => 'Testimoni',
        ];
    }

    public function getUser()
    {
        return $this->hasOne(USER::className(), ['id' => 'User_ID']);
    }
}
