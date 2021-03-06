<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Quiz;

/**
 * QuizSearch represents the model behind the search form about `common\models\Quiz`.
 */
class QuizSearch extends Quiz
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Quiz_ID', 'flag'], 'integer'],
            [['Title', 'Description'], 'safe'],
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
        $query = Quiz::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
		
		//$query->joinWith(['qUIZCONTENTs' => function($query) { $query->from(['propensi.QUIZ_CONTENT']);}]);
		$query->joinWith(['questions' => function($query) { $query->from(['propensi.QUESTION']);}]);
		
        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'Quiz_ID' => $this->Quiz_ID,
            'flag' => $this->flag,
        ]);

        $query->andFilterWhere(['like', 'Title', $this->Title])
            ->andFilterWhere(['like', 'Description', $this->Description]);

        return $dataProvider;
    }
}
