<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ActivityLogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Mengirim email';
$this->params['breadcrumbs'][] = $this->title;
?>
		
Email Anda berhasil terkirim<br>
<?php echo $emailErr; ?>
<?= Html::a('Kembali ke halaman awal', ['site/index']) ?>
	
