<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\History;

/**
 * HistorySearch represents the model behind the search form about `common\models\History`.
 */
class HistorySearch extends History
{
    /**
     * @inheritdoc
     */
	 
	public function attributes()
    {
        return array_merge(parent::attributes(), ['quiz.Title', 'result.Classification_result', 'username']);
    }
	 
    public function rules()
    {
        return [
            [['User_ID', 'Quiz_ID', 'Result_ID'], 'integer'],
            [['Timestamp', 'quiz.Title', 'result.Classification_result'], 'safe'],
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
        $query = History::find()->where(['User_ID' => $params]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

		$query->joinWith(['user' => function($query) { $query->from(['propensi.user']);}]);
		$query->joinWith(['quiz' => function($query) { $query->from(['propensi.QUIZ']);}]);
		$query->joinWith(['result' => function($query) { $query->from(['propensi.QUIZ_RESULT']);}]);
		$dataProvider->sort->attributes['quiz.Title'] = [
            'asc' => ['propensi.QUIZ.Title' => SORT_ASC],
            'desc'=> ['propensi.QUIZ.Title' => SORT_DESC],
        ];
		$dataProvider->sort->attributes['result.Classification_result'] = [
            'asc' => ['propensi.QUIZ_RESULT.Classification_result' => SORT_ASC],
            'desc'=> ['propensi.QUIZ_RESULT.Classification_result' => SORT_DESC],
        ];
		$dataProvider->sort->attributes['username'] = [
            'asc' => ['propensi.user.username' => SORT_ASC],
            'desc'=> ['propensi.user.username' => SORT_DESC],
        ];
		
        //$this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'User_ID' => $this->User_ID,
            'Timestamp' => $this->Timestamp,
            'Quiz_ID' => $this->Quiz_ID,
            'Result_ID' => $this->Result_ID,
        ]);
		$query->andFilterWhere(['like', 'propensi.QUIZ.Title', $this->getAttribute('quiz.Title')])
            ->andFilterWhere(['like', 'propensi.QUIZ_RESULT.Classification_result', $this->getAttribute('result.Classification_result')])
			->andFilterWhere(['like', 'public.tbl_user.username', $this->getAttribute('username')]);

        return $dataProvider;
    }
}
