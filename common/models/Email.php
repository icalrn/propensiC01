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
            [['receiver_email'], 'required'],
            [['message', 'attachment'], 'string'],
            [['receiver_email', 'subject'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'receiver_email' => 'Receiver Email',
            'message' => 'Message',
            'attachment' => 'Attachment',
            'subject' => 'Subject',
        ];
    }
}
