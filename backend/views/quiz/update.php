<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Quiz */

$this->title = 'Mengubah Kuesioner: ' . ' ' . $model->Title;
$this->params['breadcrumbs'][] = ['label' => 'Kuesioner', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Title, 'url' => ['view', 'id' => $model->Quiz_ID]];
$this->params['breadcrumbs'][] = 'Ubah';
?>
<div class="quiz-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'question' => $question,
        'listData' => $listData,
    ]) ?>

</div>
