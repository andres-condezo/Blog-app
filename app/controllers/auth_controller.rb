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

  def signup
    user = User.new(user_params)

    if user.save
      render json: {
        token: token(user.id),
        user_id: user.id,
        confirmation_url:
        "#{confirmation_url(user)}?confirmation_token=#{user.confirmation_token}"
      }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def logout
    user = User.find_by('lower(email) = ?', user_params[:email].downcase)

    if user&.authenticate(user_params[:password])
      render json: { message: 'Logged out' }, status: :ok
    else
      render json: { errors: ['Sorry, incorrect email or password'] }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
