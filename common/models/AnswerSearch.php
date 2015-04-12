<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Answer;

/**
 * AnswerSearch represents the model behind the search form about `common\models\Answer`.
 */
class AnswerSearch extends Answer
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['User_ID', 'Quiz_ID', 'Question_ID'], 'integer'],
            [['Timestamp', 'Answer_text', 'Subcategory_text'], 'safe'],
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
        $query = Answer::find();

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
            'User_ID' => $this->User_ID,
            'Quiz_ID' => $this->Quiz_ID,
            'Question_ID' => $this->Question_ID,
            'Timestamp' => $this->Timestamp,
        ]);

        $query->andFilterWhere(['like', 'Answer_text', $this->Answer_text])
            ->andFilterWhere(['like', 'Subcategory_text', $this->Subcategory_text]);

        return $dataProvider;
    }
}
