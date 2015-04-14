<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\QuizResult */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="quiz-result-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Quiz_ID')->textInput() ?>

    <?= $form->field($model, 'Classification_result')->textInput(['maxlength' => 20]) ?>

    <?= $form->field($model, 'Result_text')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Buat' : 'Ubah', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
