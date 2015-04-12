<?php

namespace backend\controllers;

use Yii;
use common\models\Categorization;
use common\models\CategorizationSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CategorizationController implements the CRUD actions for Categorization model.
 */
class CategorizationController extends Controller
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
     * Lists all Categorization models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CategorizationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Categorization model.
     * @param integer $Category_ID
     * @param string $Subcategory_text
     * @return mixed
     */
    public function actionView($Category_ID, $Subcategory_text)
    {
        return $this->render('view', [
            'model' => $this->findModel($Category_ID, $Subcategory_text),
        ]);
    }

    /**
     * Creates a new Categorization model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Categorization();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Category_ID' => $model->Category_ID, 'Subcategory_text' => $model->Subcategory_text]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Categorization model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $Category_ID
     * @param string $Subcategory_text
     * @return mixed
     */
    public function actionUpdate($Category_ID, $Subcategory_text)
    {
        $model = $this->findModel($Category_ID, $Subcategory_text);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Category_ID' => $model->Category_ID, 'Subcategory_text' => $model->Subcategory_text]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Categorization model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $Category_ID
     * @param string $Subcategory_text
     * @return mixed
     */
    public function actionDelete($Category_ID, $Subcategory_text)
    {
        $this->findModel($Category_ID, $Subcategory_text)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Categorization model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $Category_ID
     * @param string $Subcategory_text
     * @return Categorization the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($Category_ID, $Subcategory_text)
    {
        if (($model = Categorization::findOne(['Category_ID' => $Category_ID, 'Subcategory_text' => $Subcategory_text])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
