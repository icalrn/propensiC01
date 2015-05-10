<?php

namespace frontend\controllers;

use Yii;
use common\models\History;
use common\models\Quiz;
use common\models\User;
use common\models\QuizResult;
use common\models\HistorySearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * HistoryController implements the CRUD actions for History model.
 */
class HistoryController extends Controller
{
	public $enableCsrfValidation = false;

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
     * Lists all History models.
     * @return mixed
     */
    public function actionIndex($User_ID)
    {
        $searchModel = new HistorySearch();
        $dataProvider = $searchModel->search($User_ID);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single History model.
     * @param integer $User_ID
     * @param string $Timestamp
     * @return mixed
     */
    public function actionView($User_ID, $Timestamp)
    {
		$model = $this->findModel($User_ID, $Timestamp);
		$quizTitle = Quiz::findOne($model->Quiz_ID)->Title;
        return $this->render('view', [
            'model' => $model,
			'quizTitle' => $quizTitle,
        ]);
    }

    /**
     * Finds the History model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $User_ID
     * @param string $Timestamp
     * @return History the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($User_ID, $Timestamp)
    {
        if (($model = History::findOne(['User_ID' => $User_ID, 'Timestamp' => $Timestamp])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
