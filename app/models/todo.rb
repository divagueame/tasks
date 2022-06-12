class Todo < ApplicationRecord
  belongs_to :task

  validates :name, presence: true, uniqueness: {scope: :task_id }
  scope :ordered, -> { order(id: :asc) }
end
