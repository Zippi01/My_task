class TasksController < ApplicationController
  before_action :task, only: [:new, :create]
  before_action :find_task, only: [:update, :destroy, :edit]

  def index
    @tasks = Task.all
  end

  def new; end

  def create
    if task.update(task_params)
      redirect_to(tasks_path)
    else
      render(:new)
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_url
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to(tasks_path)
    else
      render(:edit)
    end
  end

  def task
    @task ||= Task.new
  end

  def find_task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :descripion, :active)
  end
end
