<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\TestimonySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Testimoni';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="testimony-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'user.username',
            'Timestamp',
            'Testimony_text:ntext',

        ],
    ]); ?>

</div>
