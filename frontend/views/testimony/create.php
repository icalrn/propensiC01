<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Testimony */

$this->title = 'Beri Testimoni';
$this->params['breadcrumbs'][] = ['label' => 'Testimonies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">

    <h1><?= Html::encode($this->title) ?></h1>
	<br>
	<h4>Anda dapat memberikan testimoni yang berisikan komentar, saran atau kritik mengenai kuesioner maupun sistem.</h4>
	<br>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
