<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\QuizContent */

$this->title = $model->Quiz_ID;
$this->params['breadcrumbs'][] = ['label' => 'Quiz Contents', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quiz-content-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID], [
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
            'Quiz_ID',
            'Question_ID',
        ],
    ]) ?>

</div>
