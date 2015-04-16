<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Categorization */

$this->title = 'Create Categorization';
$this->params['breadcrumbs'][] = ['label' => 'Categorizations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categorization-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
