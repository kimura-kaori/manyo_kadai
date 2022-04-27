class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to tasks_path, notice:'作成しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      redirect_to tasks_path, notice:'更新しました'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:'削除しました'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :content, :deadline, :priority, :status)
  end
end
