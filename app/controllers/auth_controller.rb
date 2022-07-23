class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token

  def login
    user = User.find_by('lower(email) = ?', user_params[:email].downcase)
    if user&.authenticate(user_params[:password])
      render json: { token: token(user.id), user_id: user.id }, status: :created
    else
      render json: { errors: ['Sorry, incorrect email or password'] }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
