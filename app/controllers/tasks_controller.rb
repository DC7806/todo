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
      redirect_to tasks_path, notice: t('crud.create_success', resource: Task.model_name.human)
    else
      render :new
      flash[:alert] = t('crud.create_fail')
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: t('crud.update_success', resource: Task.model_name.human)
    else
      render :edit
      flash[:alert] = t('crud.update_fail')
    end
  end 

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: t('crud.destroy_success', resource: Task.model_name.human)
  end

  private

  def find_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
  
end