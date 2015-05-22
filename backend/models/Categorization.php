<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "propensi.CATEGORIZATION".
 *
 * @property integer $Category_ID
 * @property integer $Subcategory_ID
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
            [['Category_ID', 'Subcategory_ID'], 'required'],
            [['Category_ID', 'Subcategory_ID'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Category_ID' => 'Category  ID',
            'Subcategory_ID' => 'Subcategory  ID',
        ];
    }
}
