<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Testimony */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="testimony-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'User_ID')->textInput() ?>

    <?= $form->field($model, 'Timestamp')->textInput() ?>

    <?= $form->field($model, 'Testimony_text')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
