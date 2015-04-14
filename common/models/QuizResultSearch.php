<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\QuizResult;
use common\models\Quiz;

/**
 * QuizResultSearch represents the model behind the search form about `common\models\QuizResult`.
 */
class QuizResultSearch extends QuizResult
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Result_ID', 'Quiz_ID'], 'integer'],
            [['Classification_result', 'Result_text'], 'safe'],
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
        $query = QuizResult::find();

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
            'Result_ID' => $this->Result_ID,
            'Quiz_ID' => $this->Quiz_ID,
        ]);

        $query->andFilterWhere(['like', 'Classification_result', $this->Classification_result])
            ->andFilterWhere(['like', 'Result_text', $this->Result_text]);

        return $dataProvider;
    }
}
