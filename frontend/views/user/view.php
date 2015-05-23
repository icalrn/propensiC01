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
    <div class="inset-wrapper inset-padded">
        <h1 class="MuseoSlab-500 header-text"><?= Html::encode($this->title) ?></h1>
        <?= Html::a('Perbarui', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <hr>

        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="col-md-12">
                    <h4 class="text-bold">Username</h4>
                    <h4><?= $model->username ?></h4>
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="col-md-12">
                    <h4 class="text-bold">Jenis Kelamin</h4>
                    <h4><?= $model->gender ?></h4>
                </div>
            </div>
        </div>
        <hr>

        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="col-md-12">
                    <h4 class="text-bold">Tanggal Lahir</h4>
                    <h4><?php 
                        if($model->date_of_birth == null)
                        {
                            echo '-';
                        }else{
                            echo $model->date_of_birth;
                        }
                    ?></h4>
                </div>
                <div class="col-md-12">
                    <h4 class="text-bold">Alamat Email</h4>
                    <h4><?php 
                        if($model->email == null)
                        {
                            echo '-';
                        }else{
                            echo $model->email;
                        }
                    ?></h4>
                </div>
                <div class="col-md-12">
                    <h4 class="text-bold">Alamat</h4>
                    <h4><?php 
                        if($model->address == null)
                        {
                            echo '-';
                        }else{
                            echo $model->address;
                        }
                    ?></h4>
                </div>
                <div class="col-md-12">
                    <h4 class="text-bold">Pendidikan Terakhir</h4>
                    <h4><?php 
                        if($model->education == null)
                        {
                            echo '-';
                        }else{
                            echo $model->education;
                        }
                    ?></h4>
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="col-md-12">
                    <h4 class="text-bold">Tempat Lahir</h4>
                    <h4><?php 
                        if($model->place_of_birth == null)
                        {
                            echo '-';
                        }else{
                            echo $model->place_of_birth;
                        }
                    ?></h4>
                </div>
                <div class="col-md-12">
                    <h4 class="text-bold">Nomor Telepon</h4>
                    <h4><?php 
                        if($model->phone == null)
                        {
                            echo '-';
                        }else{
                            echo $model->phone;
                        }
                    ?></h4>
                </div>
                <div class="col-md-12">
                    <h4 class="text-bold">Pekerjaan</h4>
                    <h4><?php 
                        if($model->occupation == null)
                        {
                            echo '-';
                        }else{
                            echo $model->occupation;
                        }
                    ?></h4>
                </div>
            </div>
        </div>
        <hr>
        </div>
    </div>
