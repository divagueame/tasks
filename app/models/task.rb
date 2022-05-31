class Task < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

#   after_create_commit -> { broadcast_prepend_later_to 'tasks' }
#   after_update_commit -> { broadcast_replace_later_to 'tasks' }
#   after_destroy_commit -> { broadcast_remove_to 'tasks' }
  broadcasts_to ->(task) { [task.team, 'tasks'] }, inserts_by: :prepend
  belongs_to :team
end
