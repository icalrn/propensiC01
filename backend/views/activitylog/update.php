<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ActivityLog */

$this->title = 'Update Activity Log: ' . ' ' . $model->User_ID;
$this->params['breadcrumbs'][] = ['label' => 'Activity Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->User_ID, 'url' => ['view', 'User_ID' => $model->User_ID, 'Timestamp' => $model->Timestamp]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="activity-log-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
