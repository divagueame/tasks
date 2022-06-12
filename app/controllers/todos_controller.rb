class TodosController < ApplicationController
  before_action :set_task

  # def show
  #   @todos = @task.todos.ordered
  # end

  def new
    @todo = @task.todos.build
  end

  # def edit; end

  def create
    @todo = @task.todos.build(todo_params)

    if @todo.save
      redirect_to task_path(@task), notice: 'Todo was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   if @task.update(task_params)
  #     respond_to do |format|
  #       format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
  #       format.turbo_stream { flash.now[:notice] = 'Task was successfully updated.' }
  #     end
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @task.destroy
  #   respond_to do |format|
  #     format.html { redirect_to tasks_path, notice: 'Task deleted successfully. Ciao cacao'}
  #     format.turbo_stream { flash.now[:notice] = 'Task deleted successfully. Ciao cacao'}
  #   end
  # end

  private

  def todo_params
    params.require(:todo).permit(:name, :done, :task_id)
  end

  def set_task
    @task = current_team.tasks.find(params[:task_id])
  end
end
