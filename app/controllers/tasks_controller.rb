class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      #フラッシュ
      redirect_to @task
    else
      #フラッシュ
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      #フラッシュ
      redirect_to @task
    else
      #フラッシュ
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    #フラッシュ
    redirect_to tasks_url
  end

  private
  def tasks_params
    params.require(:task).permit(:content)
  end

end
