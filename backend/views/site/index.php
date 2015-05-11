<?php
/* @var $this yii\web\View */
use kartik\export\ExportMenu;
use kartik\grid\GridView;

$this->title = 'Dashboard';
$this->params['breadcrumbs'][] = '';
?>
<div id="title" class="MuseoSans">Dashboard</div>

 <div class="row">
 	<div class="col-md-3">
 		<div class="col-md-12">
 			<div class="panel panel-green">
 				<div class="panel-heading">Server Time</div>
 				<div class="panel-body"><p id="servertime"></p></div>
 			</div>
 		</div>
 	</div>
 	<div class="col-md-9">
 		<div class="panel panel-green">
 			<div class="panel-heading">Kelola Sistem</div>
 			<div class="panel-body">
 				Unduh data seluruh jawaban kuesioner:&nbsp;
 				<?php
				echo ExportMenu::widget([
					'dataProvider' => $dataProvider,
					'fontAwesome' => true,
				]);
				?>
				<hr>	
			</div>
 		</div>
 	</div>
 </div>

