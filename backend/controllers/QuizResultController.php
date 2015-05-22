<?php

namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use common\models\User;
use common\models\QuizResult;
use common\models\QuizResultSearch;
use common\models\Quiz;
use common\models\QuizSearch;
use common\models\ActivityLog;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

/**
 * QuizResultController implements the CRUD actions for QuizResult model.
 */
class QuizResultController extends Controller
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
     * Lists all QuizResult models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new QuizResultSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single QuizResult model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $quiztitle = QuizResult::find()->joinWith('quiz')->onCondition(['QUIZ.Quiz_ID' => $id]);
        return $this->render('view', [
            'model' => $this->findModel($id),
            'quiztitle' => $quiztitle,
        ]);
    }

    /**
     * Creates a new QuizResult model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new QuizResult();
        $listData=ArrayHelper::map(Quiz::find()->asArray()->all(), 'Quiz_ID', 'Title');

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Membuat kesimpulan baru';
            $activitylog->save();
            return $this->redirect(['view', 'id' => $model->Result_ID]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'listData' => $listData,
            ]);
        }
    }

    /**
     * Updates an existing QuizResult model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $listData=ArrayHelper::map(Quiz::find()->asArray()->all(), 'Quiz_ID', 'Title');

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Mengubah sebuah kesimpulan';
            $activitylog->save();
            return $this->redirect(['view', 'id' => $model->Result_ID]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'listData' => $listData,
            ]);
        }
    }

    /**
     * Deletes an existing QuizResult model.
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
        $activitylog->Activity = 'Menghapus sebuah kesimpulan';
        $activitylog->save();

        return $this->redirect(['index']);
    }

    public function actionDeny(){
        return $this->goHome;
    }

    /**
     * Finds the QuizResult model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return QuizResult the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = QuizResult::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
