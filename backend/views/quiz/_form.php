<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Quiz */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="quiz-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Title')->textInput(['maxlength' => 50]) ?>

    <?= $form->field($model, 'Description')->textarea(['rows' => 6]) ?>
	
	<?= $form->field($model, 'flag')->textInput() ?>

    <?= $form->field($model, 'question_field')->checkboxList($listData, array('separator' => '<br>')) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Buat' : 'Ubah', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>

    </div>

    <?php ActiveForm::end(); ?>

</div>
