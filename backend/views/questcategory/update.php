<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\QuestCategory */

$this->title = 'Update Quest Category: ' . ' ' . $model->Question_ID;
$this->params['breadcrumbs'][] = ['label' => 'Quest Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Question_ID, 'url' => ['view', 'Question_ID' => $model->Question_ID, 'Category_ID' => $model->Category_ID]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="quest-category-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
