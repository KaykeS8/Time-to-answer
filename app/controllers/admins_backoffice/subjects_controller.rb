class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: %i[ edit destroy update]

  def index
    respond_to do |format|
      format.html { @subjects = Subject.all.order(:description).page(params[:page])}
      format.pdf {@subjects = Subject.all.order(:description)}
    end
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.create(params_subject)
    return redirect_to admins_backoffice_subjects_path, notice: 'Criado com sucesso' if @subject.save
    render :new, status: :unprocessable_entity
  end

  def edit;end

  def update
    return redirect_to admins_backoffice_subjects_path, notice: 'Atualizado com sucesso' if @subject.update(params_subject)
    render :edit, status: :unprocessable_entity
  end

  def destroy
    return redirect_to admins_backoffice_subjects_path, status: :see_other, notice: 'Deletado com sucesso' if @subject.destroy
    render :index
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def params_subject
    params.require(:subject).permit(:description)
  end
end