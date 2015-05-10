<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\HistorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Daftar Riwayat Hasil Kuesioner';
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="history-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'Timestamp',
            'quiz.Title',
            'result.Classification_result',			
			[	
				'class' => 'yii\grid\ActionColumn',
				'template' => '{view}',
			],
        ],
    ]); ?>
	
	<?= Html::a('<button class="btn btn-success btn-lg main-button">Kembali</button>', ['site/index']); ?>

</div>
