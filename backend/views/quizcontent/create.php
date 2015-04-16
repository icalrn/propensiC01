<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\QuizContent */

$this->title = 'Create Quiz Content';
$this->params['breadcrumbs'][] = ['label' => 'Quiz Contents', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quiz-content-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
