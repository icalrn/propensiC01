<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\SubCategory */

$this->title = $model->Subcategory_text;
$this->params['breadcrumbs'][] = ['label' => 'Subkategori', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sub-category-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Ubah', ['update', 'id' => $model->Subcategory_text], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Hapus', ['delete', 'id' => $model->Subcategory_text], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Apakah Anda yakin ingin menghapus subkategori ini?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'Subcategory_text',
            'Counter',
        ],
    ]) ?>

</div>
