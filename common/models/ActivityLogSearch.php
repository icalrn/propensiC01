<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\ActivityLog;

/**
 * ActivityLogSearch represents the model behind the search form about `common\models\ActivityLog`.
 */
class ActivityLogSearch extends ActivityLog
{
    public function attributes()
    {
        return array_merge(parent::attributes(), ['user.username']);
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['User_ID'], 'integer'],
            [['Timestamp', 'Activity', 'user.username'], 'safe'],
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
        $query = ActivityLog::find()->joinWith('user');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => ['defaultOrder' => ['Timestamp'=>SORT_DESC]]
        ]);

        $dataProvider->sort->attributes['user.username'] = [
            'asc' => ['propensi.user.username' => SORT_ASC],
            'desc'=> ['propensi.user.username' => SORT_DESC],
        ];

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

        $query->andFilterWhere(['like', 'Activity', $this->Activity])
            ->andFilterWhere(['like', 'propensi.user.username', $this->getAttribute('user.username')]);

        return $dataProvider;
    }
}
