<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = 'Profil';
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="inset-wrapper">
        <h1 class="MuseoSlab-500 header-text"><?= Html::encode($this->title) ?></h1>
        <?= Html::a('Perbarui', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <hr>

        <div class="row">
            <div class="col-md-6 col-sm-12">
                <h4 class="text-bold">Username</h4>
                <h4><?= $model->username ?></h4>
            </div>
            <div class="col-md-6 col-sm-12">
                <h4 class="text-bold">Jenis Kelamin</h4>
                <h4><?= $model->gender ?></h4>
            </div>
        </div>
        <hr>

        <div class="row">
            <div class="col-md-6 col-sm-12"></div>
            <div class="col-md-6 col-sm-12"></div>
        </div>

        <?= DetailView::widget([
            'model' => $model,
            'attributes' => [
            'id',
            'username',
            'email:email',
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
    </div>
