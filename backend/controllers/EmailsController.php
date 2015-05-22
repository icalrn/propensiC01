<?php

namespace backend\controllers;

use Yii;
use common\models\Email;
use common\models\EmailSearch;
use common\models\ActivityLog;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\UploadedFile;
use yii\filters\VerbFilter;

/**
 * EmailsController implements the CRUD actions for Email model.
 */
class EmailsController extends Controller
{
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
     * Lists all Email models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new EmailSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Email model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Email model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Email();

        if ($model->load(Yii::$app->request->post()))
        {
            $model->attachment = UploadedFile::getInstance($model, 'attachment');
            if($model->attachment)
            {
                $time = time();
                $model->attachment->saveAs('attachments/'.$time.'.'.$model->attachment->extension);
                $model->attachment = 'attachments/'.$time.'.'.$model->attachment->extension;
            }
            if($model->attachment)
            {
                Yii::$app->mailer->compose()
                    ->setFrom(['si.perencanaankarir@gmail.com' => 'Pusat Perencanaan Karir'])
                    ->setTo($model->receiver_email)
                    ->setSubject($model->subject)
                    ->setHtmlBody($model->message)
                    ->attach($model->attachment)
                    ->send();
            }
            else
            {
                Yii::$app->mailer->compose()
                    ->setFrom(['si.perencanaankarir@gmail.com' => 'Pusat Perencanaan Karir'])
                    ->setTo($model->receiver_email)
                    ->setSubject($model->subject)
                    ->setHtmlBody($model->message)
                    ->send();
            }
            $model->timestamp = date('Y-m-d H:i:s');
            $model->save();
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Mengirim email';
            $activitylog->save();
            return $this->redirect(['view', 'id' => $model->ID]);
        } 
        else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Email model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->ID]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Email model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $activitylog = new ActivityLog();
        $activitylog->User_ID = Yii::$app->user->id;
        $activitylog->Timestamp = date('Y-m-d H:i:s');
        $activitylog->Activity = 'Menghapus sebuah email';
        $activitylog->save();
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Email model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Email the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Email::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
