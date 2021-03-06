<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\QuestCategory;

/**
 * QuestCategorySearch represents the model behind the search form about `common\models\QuestCategory`.
 */
class QuestCategorySearch extends QuestCategory
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
            [['Question_ID', 'Category_ID'], 'integer'],
            [['category.Category_text'], 'safe']
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
        $query = QuestCategory::find();

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
            'Category_ID' => $this->Category_ID,
        ]);

        return $dataProvider;
    }

    public function searchCategory($params, $id)
    {
        $query = QuestCategory::find()->joinWith('category')->onCondition(['Question_ID' => $id]);

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
            'Question_ID' => $this->Question_ID,
            'Category_ID' => $this->Category_ID,
        ]);

        $query->andFilterWhere(['like', 'propensi.CATEGORY.Category_text', $this->getAttribute('category.Category_text')]);

        return $dataProvider;
    }

    public function searchQuestion($params, $id)
    {
        $query = QuestCategory::find()->joinWith('question')->onCondition(['Category_ID' => $id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes['question.Question_text'] = [
            'asc' => ['propensi.QUESTION.Question_text' => SORT_ASC],
            'desc'=> ['propensi.QUESTION.Question_text' => SORT_DESC],
        ];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'Question_ID' => $this->Question_ID,
            'Category_ID' => $this->Category_ID,
        ]);

        $query->andFilterWhere(['like', 'propensi.QUESTION.Question_text', $this->getAttribute('questions.Question_text')]);

        return $dataProvider;
    }
}
