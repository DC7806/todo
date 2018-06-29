class TasksController < ApplicationController

  before_action :find_task, only: [:edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: '新增成功'
    else
      render :new
      flash[:alert] = '新增失敗'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: '更新成功'
    else
      render :edit
      flash[:alert] = '更新失敗'
    end
  end 

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: '刪除成功'
  end

  private

  def find_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
  
end