<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.SUB_CATEGORY".
 *
 * @property string $Subcategory_text
 * @property integer $Counter
 *
 * @property CATEGORIZATION[] $cATEGORIZATIONs
 * @property CATEGORY[] $categories
 * @property ANSWER[] $aNSWERs
 */
class SubCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'propensi.SUB_CATEGORY';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Subcategory_text', 'Counter'], 'required'],
            [['Counter'], 'integer'],
            [['Subcategory_text'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Subcategory_text' => 'Sub-kategori',
            'Counter' => 'Jumlah',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCATEGORIZATIONs()
    {
        return $this->hasMany(CATEGORIZATION::className(), ['Subcategory_text' => 'Subcategory_text']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasMany(CATEGORY::className(), ['Category_ID' => 'Category_ID'])->viaTable('CATEGORIZATION', ['Subcategory_text' => 'Subcategory_text']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getANSWERs()
    {
        return $this->hasMany(ANSWER::className(), ['Subcategory_text' => 'Subcategory_text']);
    }
}
