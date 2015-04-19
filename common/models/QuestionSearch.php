<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Question;

/**
 * QuestionSearch represents the model behind the search form about `common\models\Question`.
 */
class QuestionSearch extends Question
{
    /**
     * @inheritdoc
     */

    public function attributes()
    {
        return array_merge(parent::attributes(), ['category.Category_text']);
    }

    public function rules()
    {
        return [
            [['Question_ID', 'Weight', 'Category_ID'], 'integer'],
            [['Question_text', 'category.Category_text'], 'safe'],
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
        $query = Question::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $query->joinWith(['category' => function($query) { $query->from(['propensi.CATEGORY']);}]);

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
            'Question_ID' => $this->Question_ID,
            'Weight' => $this->Weight,
            'Category_ID' => $this->Category_ID,
        ]);

        $query->andFilterWhere(['like', 'Question_text', $this->Question_text])
            ->andFilterWhere(['like', 'propensi.CATEGORY.Category_text', $this->getAttribute('category.Category_text')]);

        return $dataProvider;
    }

    public function searchId($params, $id)
    {
        $query = Question::find()->onCondition(['Category_ID' => $id]);

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
            'Question_ID' => $this->Question_ID,
            'Weight' => $this->Weight,
            'Category_ID' => $this->Category_ID,
        ]);

        $query->andFilterWhere(['like', 'Question_text', $this->Question_text]);

        return $dataProvider;
    }
}
