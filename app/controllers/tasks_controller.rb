class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @tasks = current_user.tasks
    @tasks = Task.order("#{sort_column} #{sort_direction}").page(params[:page])
      if params[:title].present?
        @tasks = @tasks.get_by_title params[:title]
      end
      if params[:status].present?
        @tasks = @tasks.get_by_status params[:status]
    end
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(tasks_params)
    if @task.save
      redirect_to task_path(@task.id), notice:'作成しました'
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

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end
