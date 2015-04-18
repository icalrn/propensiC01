<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\QuizResult */

$this->title = 'Membuat Kesimpulan';
$this->params['breadcrumbs'][] = ['label' => 'Kesimpulan', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quiz-result-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'listData' => $listData,
    ]) ?>

</div>
