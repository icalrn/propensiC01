<?php

namespace backend\controllers;

use Yii;
use common\models\ActivityLog;
use common\models\ActivityLogSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\UploadedFile;
use yii\filters\VerbFilter;

/**
 * ActivityLogController implements the CRUD actions for ActivityLog model.
 */
class EmailController extends Controller
{
    public $enableCsrfValidation = false;

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all ActivityLog models.
     * @return mixed
     */
    public function actionIndex()
    {
        $notif = "0";
        $error = " ";
        if(Yii::$app->request->post()){
            if (empty($_POST['tujuan'])) {
                $error = "Tujuan harus diisi";
            }else{
                $tujuan = $_POST['tujuan'];
                if (!filter_var($tujuan, FILTER_VALIDATE_EMAIL)) {
                    $error = "Alamat tujuan tidak valid"; 
                }else{
                    $subject = $_POST['subject'];
                    $pesan = $_POST['pesan'];
                    Yii::$app->mailer->compose()
                        ->setFrom(['si.perencanaankarir@gmail.com' => 'Pusat Perencanaan Karir'])
                        ->setTo($tujuan)
                        ->setSubject($subject)
                        ->setHtmlBody($pesan)
                        ->send();
                    $notif = "1";
                }
            }
            return $this->render('index', [
                'notif' => $notif,
                'error' => $error,
            ]);
        }else{
            return $this->render('index', [
                'notif' => $notif,
                'error' => $error,
            ]);
        }
    }

    /**
     * Finds the ActivityLog model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $User_ID
     * @param string $Timestamp
     * @return ActivityLog the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($User_ID, $Timestamp)
    {
        if (($model = ActivityLog::findOne(['User_ID' => $User_ID, 'Timestamp' => $Timestamp])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
