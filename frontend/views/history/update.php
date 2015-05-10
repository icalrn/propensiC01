<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\History */

$this->title = 'Unauthorized Access';
//$this->params['breadcrumbs'][] = ['label' => 'Histories', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->User_ID, 'url' => ['view', 'User_ID' => $model->User_ID, 'Timestamp' => $model->Timestamp]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="history-update">

    <h1><?= Html::encode($this->title) ?></h1>

	<p>
	Maaf, Anda tidak memiliki hak untuk mengakses halaman ini (khusus Admin).
	</p>	
</div>
<?= Html::a('<button class="btn btn-success btn-lg main-button">Kembali</button>', ['history/index', 'User_ID' => Yii::$app->user->id]) ?>