<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Testimony */

$this->title = 'Update Testimony: ' . ' ' . $model->User_ID;
$this->params['breadcrumbs'][] = ['label' => 'Testimonies', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->User_ID, 'url' => ['view', 'User_ID' => $model->User_ID, 'Timestamp' => $model->Timestamp]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="testimony-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
