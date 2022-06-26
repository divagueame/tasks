class DetailsController < ApplicationController
  before_action :set_task
  before_action :set_todo
  before_action :set_detail, only: %i[edit update destroy]

  def new
    @detail = @todo.details.build
  end

  def create
    @detail = @todo.details.build(detail_params)

    if @detail.save
      respond_to do |format|
        format.html { redirect_to task_path(@task), notice: 'Detail created successfully' }
        format.turbo_stream { flash.now[:notice] = 'Detail created successfully' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @detail.update(detail_params)
      redirect_to task_path(@todo), notice: 'Detail was successfully updated.'
      # respond_to do |format|
      #   format.html { redirect_to task_path(@task), notice: 'Detail was successfully updated.' }
      #   format.turbo_stream { flash.now[:notice] = 'Detail successfully updated' }
      # end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @detail.destroy
    redirect_to task_path(@task), notice: 'Detail deleted successfully. Ciao cacao'
    # respond_to do |format|
    # format.html { redirect_to task_path(@task), notice: 'Detail deleted successfully. Ciao cacao' }
    #   format.turbo_stream { flash.now[:notice] = 'Detail deleted successfully. Ciao cacao' }
    # end
  end

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

  def set_detail
    @detail = @todo.details.find(params[:id])
  end
end
