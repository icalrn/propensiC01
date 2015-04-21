<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Answer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="answer-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'User_ID')->textInput() ?>

    <?= $form->field($model, 'Quiz_ID')->textInput() ?>

    <?= $form->field($model, 'Question_ID')->textInput() ?>

    <?= $form->field($model, 'Timestamp')->textInput() ?>

    <?= $form->field($model, 'Answer_text')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'Subcategory_text')->textInput(['maxlength' => 50]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
