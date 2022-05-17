class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.order(created_at: :desc).page(params[:page])
      if params[:title].present?
        @tasks = @tasks.get_by_title (params[:title])
      end
      if params[:status].present?
        @tasks = @tasks.get_by_status params[:status]
      end
      if params[:deadline].present?
        @tasks = @tasks.reorder(deadline: :desc)
      end
      if params[:priority]
        @tasks = @tasks.desc_sort
      end
      if params[:label_id].present?
        @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] })
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
    params.require(:task).permit(:title, :content, :deadline, :priority, :status, {label_ids: []})
  end
end
