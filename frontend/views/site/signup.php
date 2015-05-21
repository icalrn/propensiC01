<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

$this->title = 'Signup';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-signup">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>Please fill out the following fields to signup:</p>

    <div class="row">
        <div class="col-lg-5">
            <?php $form = ActiveForm::begin(['id' => 'form-signup']); ?>
                <?= $form->field($model, 'username') ?>
                <?= $form->field($model, 'email') ?>
                <?= $form->field($model, 'password')->passwordInput() ?>
				<?= $form->field($model, 'place_of_birth') ?>
				<?= $form->field($model, 'date_of_birth') ?>
                <?= 'masukan tanggal dengan format yyyy-m-d' ?>
                <?= '' ?>
				<?= $form->field($model, 'address') ?>
				<?= $form->field($model, 'gender')->dropDownList(['Pria','Wanita'], ['prompt'=>'Pilih gender']) ?>
				<?= $form->field($model, 'phone') ?>
				<?= $form->field($model, 'education')->dropDownList(['SD','SMP','SMA','D3','S1','S2','S3'], ['prompt'=>'Pilih jenjang']) ?>
				<?= $form->field($model, 'occupation') ?>
                <div class="form-group">
                    <?= Html::submitButton('Signup', ['class' => 'btn btn-primary', 'name' => 'signup-button']) ?>
                </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
