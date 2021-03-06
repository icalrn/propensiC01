<?php
use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use yii\widgets\Menu;
use rmrevin\yii\fontawesome\FA;

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
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Dashboard</div>', ['site/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Kuesioner</div>', ['quiz/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Pertanyaan</div>', ['question/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Kesimpulan</div>', ['quizresult/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Subkategori</div>', ['subcategory/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Kategori</div>', ['category/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Riwayat Sistem</div>', ['activitylog/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Lihat Testimoni</div>', ['testimony/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Kelola email</div>', ['emails/index']) ?>
		<?= Html::a('<div class="sidebar-element text-right MuseoSans">Pengguna</div>', ['user/index']) ?>
		<?= Html::a('<div class="bottom-element text-right MuseoSans">'.FA::icon('sign-out').' Logout</div>', ['site/logout'], ['data-method' => 'post'])?>
		<?= Html::a('<div class="bottom-element text-right MuseoSans">'.FA::icon('arrow-circle-right').' Go to site</div>', Yii::$app->urlManagerFrontend->baseUrl)?>
		
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
