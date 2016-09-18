class SigninController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save!
      session[:user_id] = @user.id
      render json: payload(@user)
    end

  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.message }
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end
