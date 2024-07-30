class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decode_token
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ')[1] if auth_header
    begin
      JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    rescue
      nil
    end
  end

  def authorize_request
    decoded_token = decode_token
    if decoded_token
      @current_user = User.find(decoded_token['user_id'])
    else
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end
end
