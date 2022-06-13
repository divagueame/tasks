class Todo < ApplicationRecord
  belongs_to :task

  validates :name, presence: true, uniqueness: {scope: :task_id }
  scope :ordered, -> { order(name: :asc) }
  def previous_todo
    task.todos.ordered.where('name < ?', name).last
  end
end
