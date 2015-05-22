<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\SubCategory */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sub-category-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Subcategory_text')->textInput(['maxlength' => 50]) ?>

    <?= $form->field($model, 'Counter')->textInput() ?>

    <?= $form->field($model, 'category_field')->checkboxList($listData, array('separator' => '<br>')) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Buat' : 'Ubah', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
