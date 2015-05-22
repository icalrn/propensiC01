<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Categorization;

/**
 * CategorizationSearch represents the model behind the search form about `common\models\Categorization`.
 */
class CategorizationSearch extends Categorization
{
    public function attributes()
    {
        return array_merge(parent::attributes(), ['category.Category_text', 'subcategory.Subcategory_text']);
    }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Category_ID', 'Subcategory_ID'], 'integer'],
            [['category.Category_text', 'subcategory.Subcategory_text'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Categorization::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'Category_ID' => $this->Category_ID,
            'Subcategory_ID' => $this->Subcategory_ID,
        ]);

        return $dataProvider;
    }

    public function searchCategory($params, $id)
    {
        $query = Categorization::find()->joinWith('category')->onCondition(['Subcategory_ID' => $id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes['category.Category_text'] = [
            'asc' => ['propensi.CATEGORY.Category_text' => SORT_ASC],
            'desc'=> ['propensi.CATEGORY.Category_text' => SORT_DESC],
        ];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'Category_ID' => $this->Category_ID,
            'Subcategory_ID' => $this->Subcategory_ID,
        ]);

        $query->andFilterWhere(['like', 'propensi.CATEGORY.Category_text', $this->getAttribute('category.Category_text')]);

        return $dataProvider;
    }

    public function searchSubCategory($params, $id)
    {
        $query = Categorization::find()->joinWith('subcategory')->onCondition(['Category_ID' => $id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes['subcategory.Subcategory_text'] = [
            'asc' => ['propensi.SUB_CATEGORY.Subcategory_text' => SORT_ASC],
            'desc'=> ['propensi.SUB_CATEGORY.Subcategory_text' => SORT_DESC],
        ];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'Category_ID' => $this->Category_ID,
            'Subcategory_ID' => $this->Subcategory_ID,
        ]);

        $query->andFilterWhere(['like', 'propensi.SUB_CATEGORY.Subcategory_text', $this->getAttribute('subcategory.Subcategory_text')]);

        return $dataProvider;
    }
}
