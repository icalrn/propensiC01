<?php

namespace common\models;

use Yii;
use yii\db\Query;

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
            [['Subcategory_text'], 'required', 'message' => 'Subkategori tidak boleh kosong'],
            [['Counter'], 'integer', 'message' => 'Jumlah harus berupa angka'],
            [['Subcategory_text'], 'string', 'max' => 50, 'message' => 'Panjang subkategori tidak boleh lebih dari 50 karakter'],
            [['category_field'], 'safe'],
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
            'category_field' => 'Daftar Kategori :',
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

    public function afterSave($insert, $changedAttributes){
        $query = new Query();
        $query->select('Category_ID, Subcategory_text')
            ->from('propensi.CATEGORIZATION')
            ->where('"propensi"."CATEGORIZATION"."Subcategory_text" = "' .$this->Subcategory_text. '";');
        $query->all()->delete();
        //Yii::$app->db->createCommand()->delete('propensi.CATEGORIZATION', '"propensi"."CATEGORIZATION"."Subcategory_text" == "'.$this->Subcategory_text.'"')->execute();
        if ($this->category_field!=NULL){
            foreach ($this->category_field as $id) {
                $tc = new Categorization();
                $tc->Subcategory_text = $this->Subcategory_text;
                $tc->Category_ID = $id;
                $tc->save();
            }
        }
    }
}
