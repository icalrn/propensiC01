<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ActivityLogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Activity Logs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="activity-log-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Activity Log', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'User_ID',
            'Timestamp',
            'Activity',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
