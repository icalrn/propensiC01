<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\SubCategory;

/**
 * SubCategorySearch represents the model behind the search form about `common\models\SubCategory`.
 */
class SubCategorySearch extends SubCategory
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Subcategory_text'], 'safe'],
            [['Counter', 'Subcategory_ID'], 'integer'],
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
        $query = SubCategory::find();

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
            'Counter' => $this->Counter,
            'Subcategory_ID' => $this->Subcategory_ID,
        ]);

        $query->andFilterWhere(['like', 'Subcategory_text', $this->Subcategory_text]);

        return $dataProvider;
    }
}
