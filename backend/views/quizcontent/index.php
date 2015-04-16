<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\QuizContentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Quiz Contents';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quiz-content-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Quiz Content', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'Quiz_ID',
            'Question_ID',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
