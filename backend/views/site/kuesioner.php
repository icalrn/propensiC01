<?php

use yii\helpers\Html;
use rmrevin\yii\fontawesome\FA;
$this->title = 'Kelola Kuesioner';
$this->params['breadcrumbs'][] = $this->title;
?>
<div id="title" class="MuseoSans">Kuesioner</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>Nama Kuesioner</th>
						<th>Deskripsi</th>
						<th>Tindakan</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Kuesioner Kesiapan Karir</td>
						<td>Kuesioner yang mengukur kesiapan Anda mengambil keputusan karir</td>
						<td>
							<button class="btn btn-danger"><?= FA::icon('times')?> Hapus</button>
							<button class="btn btn-success"><?= FA::icon('refresh')?> Update</button>
						</td>
					</tr>
					<tr>
						<td>Kuesioner Jalur Karir</td>
						<td>Kuesioner yang mengukur kesiapan Anda mengambil keputusan karir</td>
						<td>
							<button class="btn btn-danger"><?= FA::icon('times')?> Hapus</button>
							<button class="btn btn-success"><?= FA::icon('refresh')?> Update</button>
						</td>
					</tr>
					<tr>
						<td>Kuesioner Kepribadian</td>
						<td>Kuesioner yang mengukur kesiapan Anda mengambil keputusan karir</td>
						<td>
							<button class="btn btn-danger"><?= FA::icon('times')?> Hapus</button>
							<button class="btn btn-success"><?= FA::icon('refresh')?> Update</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<?= Html::a('Buat Baru', ['site/index'], ['class' => 'btn btn-primary btn-lg']) ?>
		</div>
	</div>
</div>