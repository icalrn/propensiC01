<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\QuestCategory */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="quest-category-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Question_ID')->textInput() ?>

    <?= $form->field($model, 'Category_ID')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
