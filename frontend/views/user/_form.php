<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'email') ?>
	<?= $form->field($model, 'place_of_birth') ?>
	<?= $form->field($model, 'date_of_birth')->label('Tanggal lahir (yyyy-MM-dd)') ?>
	<?= $form->field($model, 'address') ?>
	<?= $form->field($model, 'gender')->dropDownList(['Pria','Wanita'], ['prompt'=>'Pilih gender']) ?>
	<?= $form->field($model, 'phone') ?>
	<?= $form->field($model, 'education')->dropDownList(['SD','SMP','SMA','D3','S1','S2','S3'], ['prompt'=>'Pilih jenjang']) ?>
	<?= $form->field($model, 'occupation') ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

<?= Html::a('<button class="btn btn-danger btn-lg main-button">Cancel</button>', ['user/view', 'User_ID'=>$model->id]); ?>
</div>
