class ToggleDoneController < ApplicationController
  def todo
    @todo = Todo.find(toggle_done_params[:id])
    @todo.done = toggle_done_params[:done]
    @todo.save
  end

  def toggle_done_params
    params.require(:todo).permit(:id, :done, :task_id)
  end
end
