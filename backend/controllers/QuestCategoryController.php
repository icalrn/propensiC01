<?php

namespace backend\controllers;

use Yii;
use common\models\QuestCategory;
use common\models\QuestCategorySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * QuestCategoryController implements the CRUD actions for QuestCategory model.
 */
class QuestcategoryController extends Controller
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
     * Lists all QuestCategory models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new QuestCategorySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single QuestCategory model.
     * @param integer $Question_ID
     * @param integer $Category_ID
     * @return mixed
     */
    public function actionView($Question_ID, $Category_ID)
    {
        return $this->render('view', [
            'model' => $this->findModel($Question_ID, $Category_ID),
        ]);
    }

    /**
     * Creates a new QuestCategory model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new QuestCategory();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Question_ID' => $model->Question_ID, 'Category_ID' => $model->Category_ID]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing QuestCategory model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $Question_ID
     * @param integer $Category_ID
     * @return mixed
     */
    public function actionUpdate($Question_ID, $Category_ID)
    {
        $model = $this->findModel($Question_ID, $Category_ID);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Question_ID' => $model->Question_ID, 'Category_ID' => $model->Category_ID]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing QuestCategory model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $Question_ID
     * @param integer $Category_ID
     * @return mixed
     */
    public function actionDelete($Question_ID, $Category_ID)
    {
        $this->findModel($Question_ID, $Category_ID)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the QuestCategory model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $Question_ID
     * @param integer $Category_ID
     * @return QuestCategory the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($Question_ID, $Category_ID)
    {
        if (($model = QuestCategory::findOne(['Question_ID' => $Question_ID, 'Category_ID' => $Category_ID])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
