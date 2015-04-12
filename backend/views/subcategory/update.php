<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\SubCategory */

$this->title = 'Update Sub Category: ' . ' ' . $model->Subcategory_text;
$this->params['breadcrumbs'][] = ['label' => 'Sub Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Subcategory_text, 'url' => ['view', 'id' => $model->Subcategory_text]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="sub-category-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
