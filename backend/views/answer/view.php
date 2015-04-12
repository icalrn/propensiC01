<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Answer */

$this->title = $model->User_ID;
$this->params['breadcrumbs'][] = ['label' => 'Answers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="answer-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'User_ID' => $model->User_ID, 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID, 'Timestamp' => $model->Timestamp], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'User_ID' => $model->User_ID, 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID, 'Timestamp' => $model->Timestamp], [
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
            'Quiz_ID',
            'Question_ID',
            'Timestamp',
            'Answer_text:ntext',
            'Subcategory_text',
        ],
    ]) ?>

</div>
