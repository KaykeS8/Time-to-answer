class Site::SearchController < SiteController
  
  def questions
    @questions = Question.search_question(params[:term], params[:page])
  end
end

