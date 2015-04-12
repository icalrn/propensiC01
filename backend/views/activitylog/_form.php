<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ActivityLog */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="activity-log-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Timestamp')->textInput() ?>

    <?= $form->field($model, 'Activity')->textInput(['maxlength' => 100]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
