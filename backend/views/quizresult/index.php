<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\QuizResultSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Kesimpulan';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quiz-result-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Buat Kesimpulan', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'quiz.Title',
            'Classification_result',
            'Result_text:ntext',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>