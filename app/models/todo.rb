class Todo < ApplicationRecord
  belongs_to :task
  has_many :details, dependent: :destroy
  
  validates :name, presence: true, uniqueness: {scope: :task_id }
  scope :ordered, -> { order(name: :asc) }
  def previous_todo
    task.todos.ordered.where('name < ?', name).last
  end
end
