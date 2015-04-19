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
	
	<table>
	<tr>
		<td width=50%>	
			<h1><?= Html::encode('Daftar Pertanyaan') ?></h1>
			<table border = 1>
				<tr><td>#</td><td>Pertanyaan</td></tr>
			<?php
				for ($x = 0; $x < $count; $x++) {
					echo "<tr><td>";
					echo $x+1;
					echo "</td><td>$result[$x]</td>";
					echo "</tr>";
				}  ?>
			</table>
		</td>
		<td valign="top" width=50%>	
		<h1><?= Html::encode('Daftar Kesimpulan') ?></h1>
			<table border = 1>
				<tr><td>#</td><td>Kesimpulan</td></tr>
			<?php
				for ($x = 0; $x < $count2; $x++) {
					echo "<tr><td>";
					echo $x+1;
					echo "</td><td>$result2[$x]</td>";
					echo "</tr>";
				}  ?>
			</table>
		</td>
	</tr>
</table>

</div>
