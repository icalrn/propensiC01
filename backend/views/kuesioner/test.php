<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Quiz */
/* @var $form ActiveForm */
?>
<div class="kuesioner-test">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'Title') ?>
        <?= $form->field($model, 'Description') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- kuesioner-test -->
