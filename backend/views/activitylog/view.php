<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\ActivityLog */

$this->title = $model->User_ID;
$this->params['breadcrumbs'][] = ['label' => 'Activity Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="activity-log-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'User_ID' => $model->User_ID, 'Timestamp' => $model->Timestamp], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'User_ID' => $model->User_ID, 'Timestamp' => $model->Timestamp], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'User_ID',
            'Timestamp',
            'Activity',
        ],
    ]) ?>

</div>
