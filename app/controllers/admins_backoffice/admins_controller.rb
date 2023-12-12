class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :verify_password, only: :update
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all.page(params[:page])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(params_admin)
    return redirect_to admins_backoffice_admins_path, notice:'Cadastrado com sucesso' if @admin.save
    render :new, status: :unprocessable_entity
  end

  def edit;end

  def update
    return redirect_to admins_backoffice_admins_path, notice: 'Atualizado com succeso' if @admin.update(params_admin)
    render :edit, status: :unprocessable_entity
  end
  
  def destroy
    return redirect_to admins_backoffice_admins_path, status: :see_other, notice: 'Administrador excluido com sucesso' if @admin.destroy
    reder :index
  end

  private

  def verify_password
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
  
  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
