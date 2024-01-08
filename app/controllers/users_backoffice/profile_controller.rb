class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :verify_password, only: %i[ update ]
  before_action :set_user, only: %i[ edit update ]
  def edit;end
  
  def update
    if @user.update(user_params)
      redirect_to users_backoffice_profile_path, notice: 'Atualizado com successo'
      sign_in(@user, bypass: true)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

end
