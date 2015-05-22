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
        return array_merge(parent::attributes(), ['category.Category_text']);
    }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Category_ID'], 'integer'],
            [['Subcategory_text', 'category.Category_text'], 'safe'],
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
        ]);

        $query->andFilterWhere(['like', 'Subcategory_text', $this->Subcategory_text]);

        return $dataProvider;
    }
    public function searchCategory($params, $id)
    {
        $query = Categorization::find()->joinWith('category')->onCondition(['Subcategory_text' => $id]);

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
        ]);

        $query->andFilterWhere(['like', 'Subcategory_text', $this->Subcategory_text])
            ->andFilterWhere(['like', 'propensi.CATEGORY.Category_text', $this->getAttribute('category.Category_text')]);

        return $dataProvider;
    }
}
