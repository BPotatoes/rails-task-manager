class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save
    redirect_to tasks_path
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(task_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path(@task)
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path(@tasks), status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
