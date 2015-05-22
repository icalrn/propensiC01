<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\QuestCategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Quest Categories';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quest-category-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Quest Category', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'Question_ID',
            'Category_ID',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
