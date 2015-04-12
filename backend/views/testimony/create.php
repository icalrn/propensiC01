<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Testimony */

$this->title = 'Create Testimony';
$this->params['breadcrumbs'][] = ['label' => 'Testimonies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="testimony-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
