<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Categorization */

$this->title = $model->Category_ID;
$this->params['breadcrumbs'][] = ['label' => 'Categorizations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categorization-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'Category_ID' => $model->Category_ID, 'Subcategory_text' => $model->Subcategory_text], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'Category_ID' => $model->Category_ID, 'Subcategory_text' => $model->Subcategory_text], [
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
            'Category_ID',
            'Subcategory_text',
        ],
    ]) ?>

</div>
