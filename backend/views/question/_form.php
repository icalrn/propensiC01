<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;


/* @var $this yii\web\View */
/* @var $model common\models\Question */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="question-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Question_text')->textInput(['maxlength' => 100]) ?>

    <?= $form->field($model, 'Weight')->textInput() ?>
    <?php 
    	$listData=ArrayHelper::map(\common\models\Question::find()->asArray()->all(), 'Question_ID', 'Category_ID');
        echo $form->field($model, 'Category_ID')->dropDownList($listData, ['prompt'=>'Pilih Kategori']);
    ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Buat' : 'Ubah', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
