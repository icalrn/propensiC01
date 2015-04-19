<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Quiz */

$this->title = $model->Title;
$this->params['breadcrumbs'][] = ['label' => 'Kuesioner', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quiz-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Ubah', ['update', 'id' => $model->Quiz_ID], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Hapus', ['delete', 'id' => $model->Quiz_ID], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Apakah Anda yakin ingin menghapus kuesioner ini?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'Title',
            'Description:ntext',
        ],
    ]) ?>
	
	<h3><?= Html::encode('Daftar Pertanyaan') ?></h3>
	<?= GridView::widget([
        'dataProvider' => $dataProviderQuestion,
        'filterModel' => $searchModelQuestion,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'questions.Question_text',

        ],
    ]); ?><br>

    <h3><?= Html::encode('Daftar Kesimpulan') ?></h3>
    <?= GridView::widget([
        'dataProvider' => $dataProviderQuizResult,
        'filterModel' => $searchModelQuizResult,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'Classification_result',

        ],
    ]); ?>

</div>
