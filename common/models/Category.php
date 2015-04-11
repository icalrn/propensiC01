<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property string $Category_text
 * @property string $Subcategory_text
 *
 * @property SubCategory $subcategoryText
 * @property Question[] $questions
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Category_text', 'Subcategory_text'], 'required'],
            [['Category_text'], 'string', 'max' => 20],
            [['Subcategory_text'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Category_text' => 'Category Text',
            'Subcategory_text' => 'Subcategory Text',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubcategoryText()
    {
        return $this->hasOne(SubCategory::className(), ['Subcategory_text' => 'Subcategory_text']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuestions()
    {
        return $this->hasMany(Question::className(), ['Category_text' => 'Category_text']);
    }
}
