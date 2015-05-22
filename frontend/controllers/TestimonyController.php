<?php

namespace frontend\controllers;

use Yii;
use common\models\Testimony;
use common\models\TestimonySearch;
use common\models\ActivityLog;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * TestimonyController implements the CRUD actions for Testimony model.
 */
class TestimonyController extends Controller
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
     * Lists all Testimony models.
     * @return mixed
     */
    public function actionIndex()
    {
		return $this->redirect(['site/index/']);
    }


    /**
     * Creates a new Testimony model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Testimony();
		$model->User_ID = Yii::$app->user->id;
		$model->Timestamp = date('Y-m-d H:i:s');
		if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Mengisi testimoni';
            $activitylog->save();
            return $this->redirect(['submit']);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }
	
	public function actionSubmit()
	{
		return $this->render('submit');
	}


    /**
     * Finds the Testimony model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $User_ID
     * @param string $Timestamp
     * @return Testimony the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($User_ID, $Timestamp)
    {
        if (($model = Testimony::findOne(['User_ID' => $User_ID, 'Timestamp' => $Timestamp])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
