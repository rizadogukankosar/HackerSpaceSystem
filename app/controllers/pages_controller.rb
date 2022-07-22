class PagesController < ApplicationController
  before_action :require_user, only: [:home]

  def home
    unless user_signed_in?
      redirect_to new_user_session_path
    end
     key = SecureRandom.random_bytes(32)
     crypt = ActiveSupport::MessageEncryptor.new(key)
     encrypted_data = crypt.encrypt_and_sign(current_user.email.to_s)
     @userQrDetails = encrypted_data
     @currentUser = current_user
     #decrypted_back = crypt.decrypt_and_verify(encrypted_data)
  end

  def about
  end

  def contact
  end


  private

  def require_user
    unless user_signed_in?
        redirect_to new_user_session_path
    end
  end

  def create
    @user = User.create( user_params )
  end

  def user_params
    params.require(:user).permit(:avatar)
  end

end
