class TasksController < ApplicationController
  include TasksHelper
  
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  
  def index
    if logged_in?
      @tasks = current_user.tasks.page(params[:page]).per(3)
    end
  end
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(tasks_params)
    if @task.save
      flash[:success] = "正常に投稿されました"
      redirect_to @task
    else
      flash.now[:danger] = "エラー：正常に投稿されませんでした"
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      flash[:success] = "正常に投稿されました"
      redirect_to @task
    else
      flash[:danger] = "エラー：正常に投稿されませんでした"
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "投稿が削除されました"
    redirect_to tasks_url
  end
  
  private
  def set_tasks
    @task = Task.find(params[:id])
  end
  
  
  def tasks_params
    params.require(:task).permit(:content)
  end

end
