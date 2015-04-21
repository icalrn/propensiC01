<?php
use yii\helpers\Html;
use rmrevin\yii\fontawesome\FA;
use yii\widgets\ActiveForm;

$this->title = $quizModel->Title;
?>

<div class="quiz-wrapper">
	<div id="quizheader">
		<div class="row">
			<div class="col-md-3 text-right" id="header-logo">
				<?= FA::icon('question-circle')->size(FA::SIZE_5X)?>
			</div>
			<div class="col-md-9">
				<div id="header-title" class="Museo-700"><?= $quizModel->Title ?></div>
				<div id="header-subtitle" class="Museo-300"><?= $quizModel->Description ?></div>
			</div>
		</div>
	</div>

	<?php foreach ($model as $quest) {
		# code...
	echo '
	<div class="question Museo-300">
		'.$quest->Question_text.'
	</div>
	<div>';
    echo '<textarea class="answer" name="pertanyaan-'.$quest->Question_ID.'"></textarea>';
	echo '</div>';
	}?>

	<div class="tombols text-center">
		<?= Html::a('<button class="btn btn-lg btn-primary">Submit</button>', ['site/post', 'ids' => $ids])?>
		<?= Html::a('<button class="btn btn-lg btn-danger">Cancel</button>', ['site/index'])?>
	</div>
</div>