<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sub_category".
 *
 * @property string $Subcategory_text
 * @property integer $Counter
 *
 * @property Answer[] $answers
 * @property Category[] $categories
 */
class SubCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sub_category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Subcategory_text'], 'required'],
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
            'Subcategory_text' => 'Subcategory Text',
            'Counter' => 'Counter',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAnswers()
    {
        return $this->hasMany(Answer::className(), ['Subcategory_text' => 'Subcategory_text']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasMany(Category::className(), ['Subcategory_text' => 'Subcategory_text']);
    }
}
