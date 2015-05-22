<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model common\models\Category */

$this->title = $model->Category_text;
$this->params['breadcrumbs'][] = ['label' => 'Kategori', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Ubah', ['update', 'id' => $model->Category_ID], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Hapus', ['delete', 'id' => $model->Category_ID], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Apakah Anda yakin ingin menghapus kategori ini?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'Category_text',
        ],
    ]) ?>

    <h3><?= Html::encode('Daftar Pertanyaan') ?></h3>
    <?= GridView::widget([
        'dataProvider' => $dataProviderQuestion,
        'filterModel' => $searchModelQuestion,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'question.Question_text',

        ],
    ]); ?>

    <h3><?= Html::encode('Daftar Subkategori') ?></h3>
    <?= GridView::widget([
        'dataProvider' => $dataProviderSubcategory,
        'filterModel' => $searchModelSubcategory,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'subcategory.Subcategory_text',

        ],
    ]); ?>

</div>
