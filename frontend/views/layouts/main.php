<?php
use common\models\User;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use frontend\assets\MuseoAsset;
use frontend\widgets\Alert;
use yii\bootstrap\BootstrapAsset;

BootstrapAsset::register($this);
AppAsset::register($this);
MuseoAsset::register($this);
?>
<?php $this->beginPage() ?>
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
	<?php
		NavBar::begin([
				'brandLabel' => 'Pusat Perencanaan Karir',
				'brandOptions' => ['class' => 'Museo-500'],
				'brandUrl' => Yii::$app->homeUrl,
				'options' => [
					'class' => 'navbar-blue navbar-fixed-top',
				],
		]);
		$activateItems =true;
		$menuItems = [
			['label' => 'Home', 'url' => ['/site/index']],
			['label' => 'Tentang', 'url' => ['/site/about']],
		];
		if (Yii::$app->user->isGuest) {
			$menuItems[] = ['label' => 'Daftar', 'url' => ['/site/signup']];
			$menuItems[] = ['label' => 'Masuk', 'url' => ['/site/login']];
		} else {
			if (User::isAdmin(Yii::$app->user->id))
				{
					$menuItems[] = ['label' => 'Administrasi', 'url' => Yii::$app->urlManagerBackend->baseUrl];
				}
			$menuItems[] = ['label' => 'Profil', 'url' => ['user/view', 'User_ID' => Yii::$app->user->id]];
			$menuItems[] = ['label' => 'Riwayat', 'url' => ['history/index', 'User_ID' => Yii::$app->user->id]];
			$menuItems[] = ['label' => 'Testimoni', 'url' => ['testimony/create']];

			$menuItems[] = [
			'label' => 'Keluar (' . Yii::$app->user->identity->username . ')',
			'url' => ['/site/logout'],
			'linkOptions' => ['data-method' => 'post']
			];
		}
		echo Nav::widget([
			'options' => ['class' => 'navbar-nav navbar-right'],
			'items' => $menuItems,
			]);
		NavBar::end();
	?>
	<div class="page-wrapper">
		<?= $content ?>
	</div>
	<?php $this->endBody() ?>
</body>
<?php $this->endPage() ?>