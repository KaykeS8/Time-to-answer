class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :fetch_question, only: %i[ edit update destroy]
  before_action :get_subjects, only: %i[ new edit ]

  def index
    @questions = Question.includes(:subject).order(:description).page(params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(questions_params)
    return redirect_to admins_backoffice_questions_path, notice: 'Questão criada com sucesso' if @question.save
    render :new, status: :unprocessable_entity
  end

  def edit;end

  def update
    return redirect_to admins_backoffice_questions_path, notice: 'Atualizado com sucesso' if @question.update(questions_params)
    render :edit, status: :unprocessable_entity
  end

  def destroy
    return redirect_to admins_backoffice_questions_path, status: :see_other, notice: 'Excluido com sucesso' if @question.destroy
    render :index, status: :unprocessable_entity
  end

  private

  def fetch_question
    @question = Question.find(params[:id])
  end

  def get_subjects
    @subjects = Subject.all
  end

  def questions_params
    params.require(:question).permit(:description, :subject_id)
  end
end
