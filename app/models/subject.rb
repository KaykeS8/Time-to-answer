class Subject < ApplicationRecord
  validates :description, presence: true
  has_many :questions
end
