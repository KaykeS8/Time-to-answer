class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :verify_password, only: %i[ update ]
  before_action :set_user, only: %i[ edit update ]

  def edit
    @user.build_user_profile if @user.user_profile.blank?
  end
  
  def update
    if @user.update(user_params)
      bypass_sign_in @user
      redirect_to users_backoffice_profile_path, notice: 'Atualizado com successo'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
   params.require(:user).permit(:name, :first_name, :last_name, :email, :password, :password_confirmation, user_profile_attributes: [:id, :address, :gender, :birthdate])
  end
 
  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

end
