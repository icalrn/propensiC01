<?php
/* @var $this yii\web\View */
use kartik\export\ExportMenu;
use yii\data\SqlDataProvider;
use kartik\grid\GridView;

$this->title = 'Dashboard';
$this->params['breadcrumbs'][] = '';

$dataProvider = new SqlDataProvider([
		'sql' => 'SELECT * FROM "ANSWER"',
	]);
?>
<div id="title" class="MuseoSans">Dashboard</div>
<?php
echo ExportMenu::widget([
		'dataProvider' => $dataProvider,
		'fontAwesome' => true,
	]);
 ?>

