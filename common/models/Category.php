<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.CATEGORY".
 *
 * @property integer $Category_ID
 * @property string $Category_text
 *
 * @property CATEGORIZATION[] $cATEGORIZATIONs
 * @property SUBCATEGORY[] $subcategoryTexts
 * @property QUESTION[] $qUESTIONs
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.CATEGORY';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Category_text'], 'required', 'message' => 'Kategori tidak boleh kosong'],
            [['Category_text'], 'string', 'max' => 30]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Category_ID' => 'Category  ID',
            'Category_text' => 'Kategori',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCATEGORIZATIONs()
    {
        return $this->hasMany(CATEGORIZATION::className(), ['Category_ID' => 'Category_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubcategoryTexts()
    {
        return $this->hasMany(SUBCATEGORY::className(), ['Subcategory_text' => 'Subcategory_text'])->viaTable('CATEGORIZATION', ['Category_ID' => 'Category_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQUESTIONs()
    {
        return $this->hasMany(QUESTION::className(), ['Category_ID' => 'Category_ID']);
    }
}
