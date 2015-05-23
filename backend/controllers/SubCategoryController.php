<?php

namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use common\models\User;
use common\models\SubCategory;
use common\models\SubCategorySearch;
use common\models\CategorizationSearch;
use common\models\Category;
use common\models\ActivityLog;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

/**
 * SubCategoryController implements the CRUD actions for SubCategory model.
 */
class SubcategoryController extends Controller
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
                        'actions' => ['error'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action){
                            return !User::isAdmin(Yii::$app->user->id);
                        }
                    ],
                    [
                        'actions' => ['index', 'view', 'create', 'update', 'delete'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action){
                            return User::isAdmin(Yii::$app->user->id);
                        }
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
     * Lists all SubCategory models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SubCategorySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single SubCategory model.
     * @param integer $id
     * @return mixed
     */
     public function actionView($id)
    {
        $searchModel = new CategorizationSearch();
        $dataProvider = $searchModel->searchCategory(Yii::$app->request->queryParams, $id);

        return $this->render('view', [
            'model' => $this->findModel($id),
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Creates a new SubCategory model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new SubCategory();
        $listData=ArrayHelper::map(Category::find()->asArray()->all(), 'Category_text', 'Category_text');
        ArrayHelper::multisort($listData, [SORT_ASC]);

        if ($model->load(Yii::$app->request->post())) {
            $model->Counter = '0';
            $model->save();
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Membuat subkateogri baru';
            $activitylog->save();
            return $this->redirect(['view', 'id' => $model->Subcategory_ID]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'listData' => $listData,
            ]);
        }
    }

    /**
     * Updates an existing SubCategory model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $listData=ArrayHelper::map(Category::find()->asArray()->all(), 'Category_text', 'Category_text');
        ArrayHelper::multisort($listData, [SORT_ASC]);
        $model->category_field = ArrayHelper::getColumn($model->getCategory()->asArray()->all(),'Category_text');

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Mengubah sebuah subkategori';
            $activitylog->save();
            return $this->redirect(['view', 'id' => $model->Subcategory_ID]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'listData' => $listData,
            ]);
        }
    }

    /**
     * Deletes an existing SubCategory model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $activitylog = new ActivityLog();
        $activitylog->User_ID = Yii::$app->user->id;
        $activitylog->Timestamp = date('Y-m-d H:i:s');
        $activitylog->Activity = 'Menghapus sebuah subkategori';
        $activitylog->save();
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the SubCategory model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return SubCategory the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = SubCategory::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
