<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Category */

$this->title = $model->Category_text;
$this->params['breadcrumbs'][] = ['label' => 'Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'Category_text' => $model->Category_text, 'Subcategory_text' => $model->Subcategory_text], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'Category_text' => $model->Category_text, 'Subcategory_text' => $model->Subcategory_text], [
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
            'Category_text',
            'Subcategory_text',
        ],
    ]) ?>

</div>
