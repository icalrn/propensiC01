<?php
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use yii\widgets\Menu;

AppAsset::register($this);
?>

<?php $this->beginPage(); ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
	<?php $this->beginBody() ?>
	<div id="sidebar">
		<?= Html::a('<div class="sidebar-element text-right MuseoSans active">Dashboard</div>', ['site/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Kuesioner</div>', ['kuesioner/index']) ?>
		<!-- <a href="#"><div class="sidebar-element text-right MuseoSans active">Dashboard</div></a> -->
		<!-- <a href="#"><div class="sidebar-element text-right MuseoSans">Kuesioner</div></a> -->
		<a href="#"><div class="sidebar-element text-right MuseoSans">Pertanyaan</div></a>
		<a href="#"><div class="sidebar-element text-right MuseoSans">Kesimpulan</div></a>
	</div>
	<div id="page-wrapper">
		<?= Breadcrumbs::widget([
            'homeLink' => [
                'label' => Yii::t('yii', 'Dashboard'),
                'url' => Yii::$app->homeUrl,
            ],
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
		<?= $content ?>
	</div>
	<?php $this->endBody() ?>
</body>
<?php $this->endPage() ?>
