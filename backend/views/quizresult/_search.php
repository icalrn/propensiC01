<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\QuizResultSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="quiz-result-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'Result_ID') ?>

    <?= $form->field($model, 'Quiz_ID') ?>

    <?= $form->field($model, 'Classification_result') ?>

    <?= $form->field($model, 'Result_text') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
