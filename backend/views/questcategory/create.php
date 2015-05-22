<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\QuestCategory */

$this->title = 'Create Quest Category';
$this->params['breadcrumbs'][] = ['label' => 'Quest Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quest-category-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
