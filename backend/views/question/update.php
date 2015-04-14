<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Question */

$this->title = 'Ubah Pertanyaan: ' . ' ' . $model->Question_text;
$this->params['breadcrumbs'][] = ['label' => 'Pertanyaan', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Question_text, 'url' => ['view', 'id' => $model->Question_ID]];
$this->params['breadcrumbs'][] = 'Ubah';
?>
<div class="question-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
