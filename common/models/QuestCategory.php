<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.QUEST_CATEGORY".
 *
 * @property integer $Question_ID
 * @property integer $Category_ID
 */
class QuestCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.QUEST_CATEGORY';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Question_ID', 'Category_ID'], 'required'],
            [['Question_ID', 'Category_ID'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Question_ID' => 'Question  ID',
            'Category_ID' => 'Category  ID',
        ];
    }
    public function getCategory()
    {
        return $this->hasOne(CATEGORY::className(), ['Category_ID' => 'Category_ID']);
    }
}
