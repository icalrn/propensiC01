<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Testimony */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="testimony-form">

    <?php $form = ActiveForm::begin(); ?>


    <?= $form->field($model, 'Testimony_text')->textarea(['rows' => 6]) ?>

    <div class="form-group">
	
        <?= Html::submitButton('Submit', ['class' => 'btn btn-success']) ?>
		
    </div>

    <?php ActiveForm::end(); ?>
<?= Html::a('<button class="btn btn-lg btn-danger">Batal</button>', ['site/index'])?>
</div>
