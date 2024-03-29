class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions, counter_cache: true
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  paginates_per 5
  after_create :set_statistic
  
  scope :search_question, -> (term, page) {
    includes(:answers).where("lower(description) LIKE ?", "%#{term.downcase}%").page(page)
  }

  scope :search_subject, -> (page, subject_id) {
    includes(:answers, :subject).where(subject_id: subject_id).page(page)
  }

  scope :last_questions, -> (page) {
    includes(:answers).order('created_at desc').page(page)
  }

  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end

end