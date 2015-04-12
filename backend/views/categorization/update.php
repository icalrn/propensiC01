<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Categorization */

$this->title = 'Update Categorization: ' . ' ' . $model->Category_ID;
$this->params['breadcrumbs'][] = ['label' => 'Categorizations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Category_ID, 'url' => ['view', 'Category_ID' => $model->Category_ID, 'Subcategory_text' => $model->Subcategory_text]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="categorization-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
