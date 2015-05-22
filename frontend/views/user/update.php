<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = 'Perbarui Profil: ' . ' ' . $model->username;
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
	<div class="inset-wrapper inset-padded">
		<h1 class="MuseoSlab-500 header-text"><?= Html::encode($this->title) ?></h1>
		<hr>

		<?= $this->render('_form', [
        'model' => $model,
    ]) ?>
	</div>

    

</div>
