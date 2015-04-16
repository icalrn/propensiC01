<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\QuizContent */

$this->title = 'Update Quiz Content: ' . ' ' . $model->Quiz_ID;
$this->params['breadcrumbs'][] = ['label' => 'Quiz Contents', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Quiz_ID, 'url' => ['view', 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="quiz-content-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
