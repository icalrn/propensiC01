<?php

namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use common\models\Quiz;
use common\models\QuizSearch;
use common\models\Question;
use common\models\QuestionSearch;
use common\models\QuizContent;
use yii\db\query;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

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
       $query = new Query;
		$query->select('Question_text');
		$query->from('propensi.QUESTION');
		$query->innerJoin('propensi.QUIZ_CONTENT', '"propensi"."QUESTION"."Question_ID"="propensi"."QUIZ_CONTENT"."Question_ID"');
		$query->where(['Quiz_ID' => $id]);
		$result = ArrayHelper::getColumn($query->all(), 'Question_text');
		$count = count ($result);
		
		$query2 = new Query;
		$query2->select('Classification_result');
		$query2->from('propensi.QUIZ_RESULT');
		$query2->where(['Quiz_ID' => $id]);
		$result2 = ArrayHelper::getColumn($query2->all(), 'Classification_result');
		$count2 = count ($result2);

        return $this->render('view', [
            'model' => $this->findModel($id),
			'result' => $result,
			'count' => $count,
			'result2' => $result2,
			'count2' => $count2,
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
        $question = Question::find()->all();
        $listData = ArrayHelper::map(Question::find()->asArray()->all(), 'Question_ID', 'Question_text');

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->Quiz_ID]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'question' => $question,
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
