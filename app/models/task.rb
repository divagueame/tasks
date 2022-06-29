class Task < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :details, through: :todos
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  def total_time
    details.sum(&:time)
  end
  #   after_create_commit -> { broadcast_prepend_later_to 'tasks' }
  #   after_update_commit -> { broadcast_replace_later_to 'tasks' }
  #   after_destroy_commit -> { broadcast_remove_to 'tasks' }
  broadcasts_to ->(task) { [task.team, 'tasks'] }, inserts_by: :prepend
  belongs_to :team
end
