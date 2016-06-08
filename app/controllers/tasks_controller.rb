class TasksController < ApplicationController
  before_action :load_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      flash[:errors] = @task.errors.messages
      redirect_to :back
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to tasks_path
    else
      flash[:errors] = @task.errors.messages
      redirect_to :back
    end
  end

  def destroy
    @task.destroy
    redirect_to :back
  end

  private

  def load_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
