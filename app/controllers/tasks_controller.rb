class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  #重複を避ける
  def index
      @tasks = current_user.tasks.order(created_at: :desc) #ログインしているユーザーのTaskデータだけを読み出す
                                  #作成日時の新しい順に
  end

  def show
  end

  def new
    @task = Task.new
  end

  def confirm_new #確認画面を表示する
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end


  def create
    @task = Task.new(task_params.merge(user_id: current_user.id)) #ログインしているユーザーのTaskデータの登録
    if params[:back].present?
      render 'new'
      return
    end
    if @task.save
    redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
