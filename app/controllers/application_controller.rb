class ApplicationController < ActionController::API
  private

  SECRET_KEY = Rails.application.credentials.jwt_secret_key || ENV['JWT_SECRET_KEY']

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last

    begin
      decoded_token = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
      Rails.logger.info "Decoded Token: #{decoded_token}"
      @current_user = User.find_by(id: decoded_token[0]['user_id'])
    rescue JWT::DecodeError => e
      render json: { error: '認証が必要です', message: "JWT decode error: #{e.message}" }, status: :unauthorized and return
    end

    unless @current_user
      render json: { error: '認証が必要です', message: "User not found with ID: #{decoded_token[0]['user_id']}" }, status: :unauthorized and return
    end
  end
end
