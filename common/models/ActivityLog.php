<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.ACTIVITY_LOG".
 *
 * @property integer $User_ID
 * @property string $Timestamp
 * @property string $Activity
 */
class ActivityLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.ACTIVITY_LOG';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Timestamp', 'Activity'], 'required'],
            [['Timestamp'], 'safe'],
            [['Activity'], 'string', 'max' => 100]
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
            'Activity' => 'Kegiatan',
        ];
    }

    public function getUser()
    {
        return $this->hasOne(USER::className(), ['id' => 'User_ID']);
    }
}
