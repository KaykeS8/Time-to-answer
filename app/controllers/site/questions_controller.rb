class Site::QuestionsController < SiteController
  before_action :authenticate_user!, only: %i[ index ]
  def index
    @questions = Question.includes(:answers).page(params[:page])
  end
end
