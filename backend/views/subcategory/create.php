<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\SubCategory */

$this->title = 'Membuat Subkategori';
$this->params['breadcrumbs'][] = ['label' => 'Subkategori', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sub-category-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
