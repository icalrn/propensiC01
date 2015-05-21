<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\QuestCategory */

$this->title = $model->Question_ID;
$this->params['breadcrumbs'][] = ['label' => 'Quest Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quest-category-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'Question_ID' => $model->Question_ID, 'Category_ID' => $model->Category_ID], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'Question_ID' => $model->Question_ID, 'Category_ID' => $model->Category_ID], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'Question_ID',
            'Category_ID',
        ],
    ]) ?>

</div>
