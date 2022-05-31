class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit destroy update]

  def index
    @tasks = current_team.tasks.ordered
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = current_team.tasks.build(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.turbo_stream
      end
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Task deleted successfully. Ciao cacao'}
      format.turbo_stream
    end
  end

  private

  def set_task
    @task = current_team.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
