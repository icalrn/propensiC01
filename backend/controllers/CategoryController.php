<?php

namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use common\models\Category;
use common\models\CategorySearch;
use common\models\QuestionSearch;
use common\models\ActivityLog;
use common\models\QuestCategorySearch;
use common\models\CategorizationSearch;
use common\models\SubCategory;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

/**
 * CategoryController implements the CRUD actions for Category model.
 */
class CategoryController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['deny', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index', 'view', 'create', 'update', 'delete'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
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
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $searchModelQuestion = new QuestCategorySearch();
        $dataProviderQuestion = $searchModelQuestion->searchQuestion(Yii::$app->request->queryParams, $id);
        $searchModelSubcategory = new CategorizationSearch();
        $dataProviderSubcategory = $searchModelSubcategory->searchSubCategory(Yii::$app->request->queryParams, $id);

        return $this->render('view', [
            'model' => $this->findModel($id),
            'searchModelQuestion' => $searchModelQuestion,
            'dataProviderQuestion' => $dataProviderQuestion,
            'searchModelSubcategory' => $searchModelSubcategory,
            'dataProviderSubcategory' => $dataProviderSubcategory,
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
        $listData=ArrayHelper::map(SubCategory::find()->asArray()->all(), 'Subcategory_ID', 'Subcategory_text');

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Membuat kategori baru';
            $activitylog->save();
            return $this->redirect(['view', 'id' => $model->Category_ID]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'listData' => $listData,
            ]);
        }
    }

    /**
     * Updates an existing Category model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $listData=ArrayHelper::map(SubCategory::find()->asArray()->all(), 'Subcategory_ID', 'Subcategory_text');
        $model->subcategory_field = ArrayHelper::getColumn($model->getSubCategory()->asArray()->all(),'Subcategory_ID');

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Mengubah sebuah kategori';
            $activitylog->save();
            return $this->redirect(['view', 'id' => $model->Category_ID]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'listData' => $listData,
            ]);
        }
    }

    /**
     * Deletes an existing Category model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        $activitylog = new ActivityLog();
        $activitylog->User_ID = Yii::$app->user->id;
        $activitylog->Timestamp = date('Y-m-d H:i:s');
        $activitylog->Activity = 'Menghapus sebuah kategori';
        $activitylog->save();
        return $this->redirect(['index']);
    }

    public function actionDeny(){
        return $this->goHome;
    }

    /**
     * Finds the Category model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Category the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Category::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
