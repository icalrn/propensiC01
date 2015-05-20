<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ActivityLogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Mengirim email';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="email-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <form method="post" action="index.php?r=email/index">
        Tujuan    : <input type="text" name="tujuan"> *<?= $error ?><br>
        Subyek    : <input type="text" name="subject"><br>
        Pesan     : <textarea class="answer" name="pesan"></textarea>
        <div class="tombols text-center">
        <?= Html::a('<button class="btn btn-lg btn-primary" type="submit">Kirim</button>', ['email/index'])?> 
        <?= Html::a('<button class="btn btn-lg btn-warning" type="reset">Reset</button>')?>        
        </div>
    </form>

    <?= Html::a('<button class="btn btn-lg btn-danger">Batal</button>', ['site/index'])?>

    
</div>
