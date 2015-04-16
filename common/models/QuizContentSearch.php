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
    public function rules()
    {
        return [
            [['Quiz_ID', 'Question_ID'], 'integer'],
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
}
