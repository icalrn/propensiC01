<?php

namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use common\models\User;
use common\models\Quiz;
use common\models\QuizSearch;
use common\models\Question;
use common\models\QuestionSearch;
use common\models\QuizContent;
use common\models\QuizContentSearch;
use common\models\QuizResultSearch;
use common\models\ActivityLog;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\data\Pagination;

/**
 * QuizController implements the CRUD actions for Quiz model.
 */
class QuizController extends Controller
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
     * Lists all Quiz models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new QuizSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Quiz model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $searchModelQuestion = new QuizContentSearch();
        $dataProviderQuestion = $searchModelQuestion->searchId(Yii::$app->request->queryParams, $id);
        $searchModelQuizResult = new QuizResultSearch();
        $dataProviderQuizResult = $searchModelQuizResult->searchId(Yii::$app->request->queryParams, $id);


        return $this->render('view', [
            'model' => $this->findModel($id),
            'searchModelQuestion' => $searchModelQuestion,
            'dataProviderQuestion' => $dataProviderQuestion,
            'searchModelQuizResult' => $searchModelQuizResult,
            'dataProviderQuizResult' => $dataProviderQuizResult,
		]);
    }

    /**
     * Creates a new Quiz model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Quiz();
        $searchModel = new QuestionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        //$question = Question::find()->all();
        $listData = ArrayHelper::map(Question::find()->asArray()->all(), 'Question_ID', 'Question_text');
        //$pages = new Pagination(['totalCount' => count($query)]);
        //$listData = $query->offset($pages->offset)->limit($pages->limit)->all();
        ArrayHelper::multisort($listData, ['Question_text'], [SORT_ASC]);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Membuat kuesioner baru';
            $activitylog->save();

            return $this->redirect(['view', 'id' => $model->Quiz_ID]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
               // 'question' => $question,
                'listData' => $listData,
            ]);
        }
    }

    /**
     * Updates an existing Quiz model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $question = Question::find()->all();
        $listData = ArrayHelper::map(Question::find()->asArray()->all(), 'Question_ID', 'Question_text');
        $model->question_field = ArrayHelper::getColumn($model->getQuestions()->asArray()->all(),'Question_ID');

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Mengubah sebuah kuesioner';
            $activitylog->save();
            return $this->redirect(['view', 'id' => $model->Quiz_ID]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'question' => $question,
                'listData' => $listData,
            ]);
        }
    }

    /**
     * Deletes an existing Quiz model.
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
        $activitylog->Activity = 'Menghapus sebuah kuesioner';
        $activitylog->save();

        return $this->redirect(['index']);
    }
	
	public function actionDeny(){
        return $this->goHome;
    }

    /**
     * Finds the Quiz model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Quiz the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Quiz::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
