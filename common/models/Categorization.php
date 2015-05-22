<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.CATEGORIZATION".
 *
 * @property integer $Category_ID
 * @property string $Subcategory_text
 */
class Categorization extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.CATEGORIZATION';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Category_ID', 'Subcategory_text'], 'required'],
            [['Category_ID'], 'integer'],
            [['Subcategory_text'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Category_ID' => 'Category  ID',
            'Subcategory_text' => 'Subcategory Text',
        ];
    }

    public function getCategory()
    {
        return $this->hasOne(CATEGORY::className(), ['Category_ID' => 'Category_ID']);
    }
}
