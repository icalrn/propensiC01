<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\SubCategory */

$this->title = 'Mengubah Subkategori: ' . ' ' . $model->Subcategory_text;
$this->params['breadcrumbs'][] = ['label' => 'Subkategori', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Subcategory_text, 'url' => ['view', 'id' => $model->Subcategory_text]];
$this->params['breadcrumbs'][] = 'Ubah';
?>
<div class="sub-category-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
