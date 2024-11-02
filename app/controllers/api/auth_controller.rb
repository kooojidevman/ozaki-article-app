class Api::AuthController < ApplicationController
  require 'jwt'

  # ユーザー登録
  def register
    user = User.new(user_params)
    if user.save
      render json: { message: '登録が完了しました' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # ログイン
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      if user.is_activated?
        token = generate_token(user)
        render json: { token: token }, status: :ok
      else
        render json: { error: 'アカウントが有効化されていません' }, status: :unauthorized
      end
    else
      render json: { error: 'メールまたはパスワードが正しくありません' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def generate_token(user)
    JWT.encode({ user_id: user.id }, Rails.application.credentials.jwt_secret_key, 'HS256')
  end

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, algorithm: 'HS256') rescue nil
    @current_user = User.find_by(id: decoded_token[0]['user_id']) if decoded_token
    render json: { error: '認証が必要です' }, status: :unauthorized unless @current_user
  end
end
