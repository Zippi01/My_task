class TasksController < ApplicationController
  before_action :task, only: [:new, :create]
  before_action :find_task, only: [:update, :destroy, :edit]

  def index
    @active_tasks = Task.where(active: true)
    @done_tasks = Task.where(active: false)
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
    respond_to do |format|
      format.js
      format.html { redirect_to tasks_url }
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    respond_to do |format|
      format.js
      format.html do
        @task.valid? ? redirect_to(tasks_path) : render(:edit)
      end
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
