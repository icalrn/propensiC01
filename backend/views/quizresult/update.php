<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\QuizResult */

$this->title = 'Mengubah Kesimpulan: ' . ' ' . $model->Classification_result;
$this->params['breadcrumbs'][] = ['label' => 'Kesimpulan', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Classification_result, 'url' => ['view', 'id' => $model->Result_ID]];
$this->params['breadcrumbs'][] = 'Ubah';
?>
<div class="quiz-result-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'listData' => $listData,
    ]) ?>

</div>
