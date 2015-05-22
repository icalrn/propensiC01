<?php
namespace backend\controllers;

use Yii;
use common\models\User;
use yii\filters\AccessControl;
use yii\web\Controller;
use common\models\LoginForm;
use common\models\ActivityLog;
use yii\filters\VerbFilter;
use yii\data\SqlDataProvider;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout' ,'error'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action){
                            return !User::isAdmin(Yii::$app->user->id);
                        }
                    ],
                    [
                        'actions' => ['logout', 'index'],
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
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    public function beforeAction($action){
        if (parent::beforeAction($action)){
            if ($action->id=='error'){
                $this->layout='mainBackup';
                return true;
            }else{
                return true;
            }
        }
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionIndex()
    {
        /* Data Provider for database export functionality */
        $count = Yii::$app->db->createCommand('SELECT COUNT(*) FROM "propensi"."ANSWER"')->queryScalar();
        $dataProvider = new SqlDataProvider([
            'sql' => 'SELECT U."username" AS "Username", Q."Title", E."Question_text", A."Timestamp", A."Answer_text", A."Subcategory_text"  
                FROM "propensi"."ANSWER" A, "propensi"."user" U, "propensi"."QUIZ" Q, "propensi"."QUESTION" E
                WHERE A."User_ID" = U."id" AND A."Quiz_ID" = Q."Quiz_ID" AND A."Question_ID" = E."Question_ID"',
            'totalCount' => $count,
            'pagination' => ['pageSize' => $count,],
        ]);
        
        return $this->render('index', ['dataProvider' => $dataProvider,]);
    }

    public function actionLogin()
    {
        $this->layout = 'login';
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Login ke dalam sistem';
            $activitylog->save();
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionLogout()
    {
        $activitylog = new ActivityLog();
        $activitylog->User_ID = Yii::$app->user->id;
        $activitylog->Timestamp = date('Y-m-d H:i:s');
        $activitylog->Activity = 'Logout dari sistem';
            $activitylog->save();
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
