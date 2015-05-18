<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\QuizContent;

/**
 * QuizContentSearch represents the model behind the search form about `common\models\QuizContent`.
 */
class QuizContentSearch extends QuizContent
{
    /**
     * @inheritdoc
     */

    public function attributes()
    {
        return array_merge(parent::attributes(), ['questions.Question_text']);
    }

    public function rules()
    {
        return [
            [['Quiz_ID', 'Question_ID'], 'integer'],
            [['questions.Question_text'], 'safe'],
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
        $query = QuizContent::find();

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
            'Quiz_ID' => $this->Quiz_ID,
            'Question_ID' => $this->Question_ID,
        ]);

        return $dataProvider;
    }

    public function searchId($params, $id)
    {
        $query = QuizContent::find()->joinWith('questions')->onCondition(['Quiz_ID' => $id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes['questions.Question_text'] = [
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
            'Quiz_ID' => $this->Quiz_ID,
            'Question_ID' => $this->Question_ID,
        ]);

        $query->andFilterWhere(['like', 'propensi.QUESTION.Question_text', $this->getAttribute('questions.Question_text')]);

        return $dataProvider;
    }
}
