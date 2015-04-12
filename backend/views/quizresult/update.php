<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\QuizResult */

$this->title = 'Update Quiz Result: ' . ' ' . $model->Result_ID;
$this->params['breadcrumbs'][] = ['label' => 'Quiz Results', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Result_ID, 'url' => ['view', 'id' => $model->Result_ID]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="quiz-result-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
