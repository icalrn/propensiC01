<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\History */

$this->title = $quizTitle;
$this->params['breadcrumbs'][] = ['label' => 'Histories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">

    <h1><?= Html::encode($this->title) ?></h1>


    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'user.username',
            'Timestamp',
			'quiz.Title',
			'result.Classification_result',
			'result.Result_text',
        ],
    ]) ?>
	
<?= Html::a('<button class="btn btn-success btn-lg main-button">Kembali</button>', ['history/index', 'User_ID' => Yii::$app->user->id]); ?>

</div>
