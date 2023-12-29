class Site::QuestionsController < SiteController
  before_action :authenticate_user!, only: %i[ index ]
  def index
    @questions = Question.last_questions(params[:page])
  end
end
