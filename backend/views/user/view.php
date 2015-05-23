<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\bootstrap\Alert;

/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = $model->username;
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Tingkatkan', ['upgrade', 'id' => $model->id], [
            'class' => 'btn btn-primary',
            'data' => [
                'confirm' => 'Apakah Anda yakin ingin mengupgrade user ini?',
                'method' => 'post',
            ],]) ?>
        <?= Html::a('Hapus', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Apakah Anda yakin ingin menghapus user ini?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
            'email:email',
            'status',
            [
                'attribute' => 'created_at',
                'format' => ['date', 'php:d/m/Y H:i:s']
            ],
            [
                'attribute' => 'updated_at',
                'format' => ['date', 'php:d/m/Y H:i:s']
            ],
            'role',
            'date_of_birth',
            'place_of_birth',
            'address',
            'gender',
            'phone',
            'education',
            'occupation',
        ],
    ]) ?>

</div>
