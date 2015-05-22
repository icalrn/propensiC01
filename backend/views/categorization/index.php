<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorizationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Categorizations';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categorization-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Categorization', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'Category_ID',
            'Subcategory_ID',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
