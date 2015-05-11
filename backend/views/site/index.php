<?php
/* @var $this yii\web\View */
use kartik\export\ExportMenu;
use yii\data\SqlDataProvider;
use kartik\grid\GridView;

$this->title = 'Dashboard';
$this->params['breadcrumbs'][] = '';

$count = Yii::$app->db->createCommand('SELECT COUNT(*) FROM "ANSWER"')->queryScalar();

$dataProvider = new SqlDataProvider([
		'sql' => 'SELECT * FROM "ANSWER"',
		'totalCount' => $count,
		'pagination' => ['pageSize' => $count,],
	]);
?>
<div id="title" class="MuseoSans">Dashboard</div>
<?php
echo "Unduh data pemakaian sistem: ";
echo ExportMenu::widget([
		'dataProvider' => $dataProvider,
		'fontAwesome' => true,
	]);
 ?>

