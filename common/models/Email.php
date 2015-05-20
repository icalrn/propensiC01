<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.EMAIL".
 *
 * @property integer $ID
 * @property string $receiver_email
 * @property string $message
 * @property string $attachment
 * @property string $subject
 */
class Email extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.EMAIL';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['receiver_email'], 'required', 'message' => 'Email Penerima tidak boleh kosong'],
            [['message', 'attachment'], 'string'],            
            [['subject'], 'string', 'max' => 100],
            [['receiver_email'], 'email', 'message' => 'Email Penerima tidak valid']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'receiver_email' => 'Email Penerima',
            'message' => 'Pesan',
            'attachment' => 'Lampiran',
            'subject' => 'Subyek',
            'timestamp' => 'Timestamp',
        ];
    }
}
