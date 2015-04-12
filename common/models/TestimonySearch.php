<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Testimony;

/**
 * TestimonySearch represents the model behind the search form about `common\models\Testimony`.
 */
class TestimonySearch extends Testimony
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['User_ID'], 'integer'],
            [['Timestamp', 'Testimony_text'], 'safe'],
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
        $query = Testimony::find();

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
            'Timestamp' => $this->Timestamp,
        ]);

        $query->andFilterWhere(['like', 'Testimony_text', $this->Testimony_text]);

        return $dataProvider;
    }
}
