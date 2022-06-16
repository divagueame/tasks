class Detail < ApplicationRecord
  belongs_to :todo

  validates :name, presence: true
  validates :time, presence: true, numericality: { greater_than: 0 }
  delegate :task, to: :todo
end
