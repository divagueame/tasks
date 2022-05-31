class Task < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # broadcast_prepend_later_to "tasks", partial: "tasks/task", locals: { task: self }, target: "tasks"
  after_create_commit -> { broadcast_prepend_later_to 'tasks' }
  after_update_commit -> { broadcast_replace_later_to 'tasks' }
  after_destroy_commit -> { broadcast_remove_to 'tasks' }
  broadcasts_to ->(task) { tasks }, inserts_by: :prepend
end
