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
  end

  def update
  end

  def destroy
  end

  private
  def tasks_params
    params.require(:task).permit(:content)
  end

end
