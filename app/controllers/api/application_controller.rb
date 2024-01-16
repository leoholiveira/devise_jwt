# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    def user_from_token
      @jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.devise[:jwt_secret_key]).first
      user_id = @jwt_payload['sub']
      @current_user = User.find(user_id.to_s)
    end
  end
end
