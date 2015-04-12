<?php

namespace backend\controllers;

use Yii;
use common\models\Category;
use common\models\CategorySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CategoryController implements the CRUD actions for Category model.
 */
class CategoryController extends Controller
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
     * Lists all Category models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CategorySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Category model.
     * @param string $Category_text
     * @param string $Subcategory_text
     * @return mixed
     */
    public function actionView($Category_text, $Subcategory_text)
    {
        return $this->render('view', [
            'model' => $this->findModel($Category_text, $Subcategory_text),
        ]);
    }

    /**
     * Creates a new Category model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Category();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Category_text' => $model->Category_text, 'Subcategory_text' => $model->Subcategory_text]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Category model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $Category_text
     * @param string $Subcategory_text
     * @return mixed
     */
    public function actionUpdate($Category_text, $Subcategory_text)
    {
        $model = $this->findModel($Category_text, $Subcategory_text);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'Category_text' => $model->Category_text, 'Subcategory_text' => $model->Subcategory_text]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Category model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $Category_text
     * @param string $Subcategory_text
     * @return mixed
     */
    public function actionDelete($Category_text, $Subcategory_text)
    {
        $this->findModel($Category_text, $Subcategory_text)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Category model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $Category_text
     * @param string $Subcategory_text
     * @return Category the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($Category_text, $Subcategory_text)
    {
        if (($model = Category::findOne(['Category_text' => $Category_text, 'Subcategory_text' => $Subcategory_text])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
