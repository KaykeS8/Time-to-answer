class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  def self.search(term, page)
    self.includes(:answers).where("lower(description) LIKE ?", "%#{term.downcase}%").page(page)
  end

  def self.last_questions(page)
    self.includes(:answers).order('created_at desc').page(page)
  end
end