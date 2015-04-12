<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Quiz */

$this->title = 'Update Quiz: ' . ' ' . $model->Title;
$this->params['breadcrumbs'][] = ['label' => 'Quizzes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Title, 'url' => ['view', 'id' => $model->Quiz_ID]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="quiz-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
