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

    public $subcategory_field;

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
            [['Category_text'], 'string', 'max' => 30],
            [['subcategory_field'], 'safe']
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
            'subcategory_field' => 'Daftar Subkategori :'
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
    public function getSubcategory()
    {
        return $this->hasMany(SUBCATEGORY::className(), ['Subcategory_ID' => 'Subcategory_ID'])->viaTable('propensi.CATEGORIZATION', ['Category_ID' => 'Category_ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQUESTIONs()
    {
        return $this->hasMany(QUESTION::className(), ['Category_ID' => 'Category_ID']);
    }

     public function afterSave($insert, $changedAttributes){
        Yii::$app->db->createCommand()->delete('propensi.CATEGORIZATION', '"Category_ID" = '.(int) $this->Category_ID)->execute();
        if ($this->subcategory_field!=NULL){
            foreach ($this->subcategory_field as $id) {
                $subcategory = SUBCATEGORY::findOne(['Subcategory_text' => $id]);
                $tc = new Categorization();
                $tc->Category_ID = $this->Category_ID;
                $tc->Subcategory_ID = $subcategory->Subcategory_ID;
                $tc->save();
            }
        }
    }
}
