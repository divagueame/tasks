class Todo < ApplicationRecord
  belongs_to :task

  validates :name, presence: true, uniqueness: {scope: :task_id }
  validates :done, presence: true
  scope :ordered, -> { order(id: :asc) }
end
