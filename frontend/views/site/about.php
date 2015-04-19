<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
$this->title = 'About';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>Sistem Informasi Perencanaan Karir merupakan implementasi dari hasil penelitian yang dilakukan oleh 
	tim Hibah Penelitian Kerja Sama Antar Perguruan Tinggi (HIBAH PEKERTI) antara Universitas YARSI dan 
	Universitas Indonesia mengenai pengambilan keputusan karir pada usia dewasa muda di Indonesia. Sistem 
	ini akan meminta pengguna menjawab beberapa pertanyaan singkat, kemudian sistem akan menganalisis 
	jawaban pengguna berdasarkan teori yang dikembangkan dari penelitian tersebut. Dengan adanya 
	sistem ini, diharapkan pengguna dapat lebih mudah untuk membuat keputusan-keputusan dalam karirnya.</p>

    <code><?= __FILE__ ?></code>
</div>
