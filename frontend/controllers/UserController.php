<?php

namespace frontend\controllers;

use Yii;
use common\models\User;
use common\models\UserSearch;
use common\models\ActivityLog;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller
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
     * Displays a single User model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($User_ID)
    {
        return $this->render('view', [
            'model' => $this->findModel($User_ID),
        ]);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) 
		{
			switch ($model->education) 
			{
				case "0":
					$model->education = "SD";
					break;
				case "1":
					$model->education = "SMP";
					break;
				case "2":
					$model->education = "SMA";
					break;
				case "3":
					$model->education = "D3";
					break;
				case "4":
					$model->education = "S1";
					break;
				case "5":
					$model->education = "S2";
					break;
				case "6":
					$model->education = "S3";
					break;
			}
			if ($model->gender == 0)
				$model->gender = 'Pria';
			else $model->gender = 'Wanita';
			
			$model->save();
            $activitylog = new ActivityLog();
            $activitylog->User_ID = Yii::$app->user->id;
            $activitylog->Timestamp = date('Y-m-d H:i:s');
            $activitylog->Activity = 'Mengubah profil';
            $activitylog->save();
            return $this->redirect(['view', 'User_ID' => $model->id]);
        } 
		else 
		{
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
