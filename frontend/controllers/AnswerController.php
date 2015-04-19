<?php

namespace frontend\controllers;

use Yii;
use common\models\Answer;
use common\models\AnswerSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * AnswerController implements the CRUD actions for Answer model.
 */
class AnswerController extends Controller
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
     * Lists all Answer models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new AnswerSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Answer model.
     * @param integer $User_ID
     * @param integer $Quiz_ID
     * @param integer $Question_ID
     * @param string $Timestamp
     * @return mixed
     */
    public function actionView($User_ID, $Quiz_ID, $Question_ID, $Timestamp)
    {
        return $this->render('view', [
            'model' => $this->findModel($User_ID, $Quiz_ID, $Question_ID, $Timestamp),
        ]);
    }

    /**
     * Creates a new Answer model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Answer();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'User_ID' => $model->User_ID, 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID, 'Timestamp' => $model->Timestamp]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Answer model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $User_ID
     * @param integer $Quiz_ID
     * @param integer $Question_ID
     * @param string $Timestamp
     * @return mixed
     */
    public function actionUpdate($User_ID, $Quiz_ID, $Question_ID, $Timestamp)
    {
        $model = $this->findModel($User_ID, $Quiz_ID, $Question_ID, $Timestamp);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'User_ID' => $model->User_ID, 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID, 'Timestamp' => $model->Timestamp]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Answer model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $User_ID
     * @param integer $Quiz_ID
     * @param integer $Question_ID
     * @param string $Timestamp
     * @return mixed
     */
    public function actionDelete($User_ID, $Quiz_ID, $Question_ID, $Timestamp)
    {
        $this->findModel($User_ID, $Quiz_ID, $Question_ID, $Timestamp)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Answer model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $User_ID
     * @param integer $Quiz_ID
     * @param integer $Question_ID
     * @param string $Timestamp
     * @return Answer the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($User_ID, $Quiz_ID, $Question_ID, $Timestamp)
    {
        if (($model = Answer::findOne(['User_ID' => $User_ID, 'Quiz_ID' => $Quiz_ID, 'Question_ID' => $Question_ID, 'Timestamp' => $Timestamp])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
