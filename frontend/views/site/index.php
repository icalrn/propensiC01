<?php
use yii\helpers\Html;
use rmrevin\yii\fontawesome\FA;
$this->title = 'Pusat Perencanaan Karir';
?>
<!-- Masthead Section -->
<div class="masthead">
	<div class="masthead-cover"></div>
	<div class="container text-center masthead-content">
		<h1 class="title MuseoSlab-500Italic">Pusat Perencanaan Karir</h1>
		<div class="row">
			<div class="col-md-12 text-center">
				<?php
				if (Yii::$app->user->isGuest){
					echo Html::a('<button class="btn btn-primary btn-lg main-button">Daftar</button>', ['site/signup']);
					echo Html::a('<button class="btn btn-success btn-lg main-button">Masuk</button>', ['site/login']);
				}else{
					echo '<h1 class="title MuseoSlab-500">Halo, '.Yii::$app->user->identity->username.'!</h1>';
				}
				?>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row text-center" id="main-menu">
		<?php foreach ($model->find()->all() as $record) {
			echo '<div class="col-md-4"><div class="row">';
			echo '<div class="col-md-12">';
			echo Html::a('<button class="btn btn-main-menu btn-circle btn-outline">'.FA::icon('question')->size(FA::SIZE_2X).'</button>', ['site/quiz/', 'id' => $record->Quiz_ID]);
			echo '</div></div><div class="row">';
			echo Html::a('<div class="col-md-12 quiz-title" id="kuesioner-'.$record->Quiz_ID.'">'.$record->Title.'</div>', ['site/quiz/', 'id' => $record->Quiz_ID]);
			echo '</div></div></div>';

		}?>
	</div>
</div>