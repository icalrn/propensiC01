<?php

namespace backend\controllers;

use Yii;
use common\models\QuizContent;
use common\models\QuizContentSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * QuizContentController implements the CRUD actions for QuizContent model.
 */
class QuizContentController extends Controller
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
     * Lists all QuizContent models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new QuizContentSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single QuizContent model.
     * @param integer $Quiz_ID
     * @param integer $Question_ID
     * @return mixed
     */
    public function actionView($Quiz_ID, $Question_ID)
    {
        return $this->render('view', [
            'model' => $this->findModel($Quiz_ID, $Question_ID),
        ]);
    }

    /**
     * Creates a new QuizContent model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new QuizContent();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing QuizContent model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $Quiz_ID
     * @param integer $Question_ID
     * @return mixed
     */
    public function actionUpdate($Quiz_ID, $Question_ID)
    {
        $model = $this->findModel($Quiz_ID, $Question_ID);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Quiz_ID' => $model->Quiz_ID, 'Question_ID' => $model->Question_ID]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing QuizContent model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $Quiz_ID
     * @param integer $Question_ID
     * @return mixed
     */
    public function actionDelete($Quiz_ID, $Question_ID)
    {
        $this->findModel($Quiz_ID, $Question_ID)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the QuizContent model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $Quiz_ID
     * @param integer $Question_ID
     * @return QuizContent the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($Quiz_ID, $Question_ID)
    {
        if (($model = QuizContent::findOne(['Quiz_ID' => $Quiz_ID, 'Question_ID' => $Question_ID])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
