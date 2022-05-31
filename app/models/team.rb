class Team < ApplicationRecord
  validates :name, presence: true
  has_many :users, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
