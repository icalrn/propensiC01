<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model common\models\Question */

$this->title = $model->Question_text;
$this->params['breadcrumbs'][] = ['label' => 'Pertanyaan', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="question-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Ubah', ['update', 'id' => $model->Question_ID], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Hapus', ['delete', 'id' => $model->Question_ID], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Apakah Anda yakin ingin menghapus pertanyaan ini?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'Question_text',
            'Weight',
        ],
    ]) ?>

    <h3><?= Html::encode('Daftar Kategori') ?></h3>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'category.Category_text',

        ],
    ]); ?><br>

</div>
