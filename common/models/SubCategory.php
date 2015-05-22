<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "propensi.SUB_CATEGORY".
 *
 * @property string $Subcategory_text
 * @property integer $Counter
 * @property integer $Subcategory_ID
 *
 * @property CATEGORIZATION[] $cATEGORIZATIONs
 * @property CATEGORY[] $categories
 */
class SubCategory extends \yii\db\ActiveRecord
{
    public $category_field;
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
            [['Subcategory_text'], 'required'],
            [['Counter'], 'integer'],
            [['Subcategory_text'], 'string', 'max' => 50],
            [['Subcategory_text'], 'unique'],
            [['category_field'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Subcategory_text' => 'Subkategori',
            'Counter' => 'Jumlah Jawaban',
            'Subcategory_ID' => 'Subcategory  ID',
            'category_field' => 'Daftar Kategori :'
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCATEGORIZATIONs()
    {
        return $this->hasMany(CATEGORIZATION::className(), ['Subcategory_ID' => 'Subcategory_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasMany(CATEGORY::className(), ['Category_ID' => 'Category_ID'])->viaTable('propensi.CATEGORIZATION', ['Subcategory_ID' => 'Subcategory_ID']);
    }

    public function afterSave($insert, $changedAttributes){
        Yii::$app->db->createCommand()->delete('propensi.CATEGORIZATION', '"Subcategory_ID" = '.(int) $this->Subcategory_ID)->execute();
        if ($this->category_field!=NULL){
            foreach ($this->category_field as $id) {
                $tc = new Categorization();
                $tc->Subcategory_ID = $this->Subcategory_ID;
                $tc->Category_ID = $id;
                $tc->save();
            }
        }
    }
}
