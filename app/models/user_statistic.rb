class UserStatistic < ApplicationRecord
  belongs_to :user

  # Virtual attribute
  def total_questions
    self.right_questions + self.wrong_questions
  end
end