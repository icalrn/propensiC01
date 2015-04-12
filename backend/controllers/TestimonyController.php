<?php

namespace backend\controllers;

use Yii;
use common\models\Testimony;
use common\models\TestimonySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * TestimonyController implements the CRUD actions for Testimony model.
 */
class TestimonyController extends Controller
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
     * Lists all Testimony models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TestimonySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Testimony model.
     * @param integer $User_ID
     * @param string $Timestamp
     * @return mixed
     */
    public function actionView($User_ID, $Timestamp)
    {
        return $this->render('view', [
            'model' => $this->findModel($User_ID, $Timestamp),
        ]);
    }

    /**
     * Creates a new Testimony model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Testimony();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'User_ID' => $model->User_ID, 'Timestamp' => $model->Timestamp]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Testimony model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $User_ID
     * @param string $Timestamp
     * @return mixed
     */
    public function actionUpdate($User_ID, $Timestamp)
    {
        $model = $this->findModel($User_ID, $Timestamp);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'User_ID' => $model->User_ID, 'Timestamp' => $model->Timestamp]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Testimony model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $User_ID
     * @param string $Timestamp
     * @return mixed
     */
    public function actionDelete($User_ID, $Timestamp)
    {
        $this->findModel($User_ID, $Timestamp)->delete();

        return $this->redirect(['index']);
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
