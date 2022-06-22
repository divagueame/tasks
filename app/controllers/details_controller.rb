class DetailsController < ApplicationController
  before_action :set_task
  before_action :set_todo

  def new
    @detail = @todo.details.build
  end

  def create
    @detail = @todo.details.build(detail_params)

    if @detail.save
      redirect_to task_path(@task), notice: 'Detail created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

#   def edit; end

#   def update
#     if @detail.update(detail_params)
#       respond_to do |format|
#         format.html { redirect_to task_path(@task), notice: 'Todo was successfully updated.' }
#         format.turbo_stream { flash.now[:notice] = 'Todo successfully updated' }
#       end
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @todo.destroy
#     respond_to do |format|
#       format.html { redirect_to task_path(@task), notice: 'Todo deleted successfully. Ciao cacao' }
#       format.turbo_stream { flash.now[:notice] = 'Todo deleted successfully. Ciao cacao' }
#     end
#   end

  private

  def detail_params
    params.require(:detail).permit(:name, :description, :time)
  end

  def set_task
    @task = current_team.tasks.find(params[:task_id])
  end

  def set_todo
    @todo = @task.todos.find(params[:todo_id])
  end
end
