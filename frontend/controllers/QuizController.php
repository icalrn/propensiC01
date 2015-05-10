<?php

namespace frontend\controllers;
use Yii;
use common\models\Answer;
use common\models\Quiz;
use common\models\Question;
use common\models\QuizContent;
use common\models\ActivityLog;
use common\models\History;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

class QuizController extends Controller
{
    public $enableCsrfValidation = false;
    
    public function actionAttempt($id)
    {
        $ids = \yii\helpers\ArrayHelper::getColumn(QuizContent::find()->where('"Quiz_ID" = :id', [':id'=>$id])->all(), 'Question_ID');
        $quizModel = Quiz::findOne($id);
        $model = Question::find()->where(['IN', '"Question_ID"', $ids])->all();
        return $this->render('attempt', [
                'model' => $model,
                'quizModel' => $quizModel,
                'ids' => $ids,
            ]);
    }

    public function actionIndex()
    {
        return $this->redirect(['site/index/']);
    }

    public function actionSubmit($id)
    {
        $activitylog = new ActivityLog();
        $activitylog->User_ID = Yii::$app->user->id;
        $activitylog->Timestamp = date('Y-m-d H:i:s');
        $activitylog->Activity = 'Mengisi kuesioner';
        $activitylog->save();
		
		$history = new History();
		$history->User_ID = Yii::$app->user->id;
		$history->Timestamp = date('Y-m-d H:i:s');
		$history->Quiz_ID = $id;
		$history->Result_ID = '1';
		$history->save();
		

        $answers = Yii::$app->request->post('Pertanyaan');
        $quizID = $id;
        $uid = Yii::$app->user->id;
        
        foreach ($answers as $k => $jawaban) {
            $answer = new Answer();
            $answer->Quiz_ID = $id;
            $answer->User_ID = $uid;
            $answer->Timestamp = date('Y-m-d H:i:s');
            $answer->Question_ID = $k;
            $answer->Answer_text = $jawaban;
            $answer->Subcategory_text = 'Pekerjaan';
            $answer->save();
        }
        return $this->render('submit');
    }

}
