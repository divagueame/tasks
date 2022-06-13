class TodosController < ApplicationController
  before_action :set_task
  before_action :set_todo, only: [:edit, :update, :destroy]

  # def show
  #   @todos = @task.todos.ordered
  # end

  def new
    @todo = @task.todos.build
  end

  
  def create
    @todo = @task.todos.build(todo_params)

    if @todo.save
      respond_to do |format|
        format.html { redirect_to task_path(@task), notice: 'Todo was successfully created.' }
        format.turbo_stream { flash.now[notice:] = 'Todo was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to task_path(@task), notice: 'Todo was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to task_path(@task), notice: 'Todo deleted successfully. Ciao cacao'
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :done, :task_id)
  end

  def set_task
    @task = current_team.tasks.find(params[:task_id])
  end

  def set_todo
    @todo = @task.todos.find(params[:id])
  end
end
