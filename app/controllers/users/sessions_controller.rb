# frozen_string_literal: true

# app/controllers/users/sessions_controller.rb
module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(_resource, _opts = {})
      if current_user.present?
        if current_user.active?
          login_success
        else
          login_failure
        end
      else
        log_out_failure
      end
    end

    def respond_to_on_destroy
      log_out_success && return if current_user

      log_out_failure
    end

    def login_success
      render json: {
        success: true,
        active: true,
        message: 'You are logged in.',
        user: current_user
      }, status: :ok
    end

    def login_failure
      current_user.confirmation_token = 6.times.map { rand(9) }.join
      current_user.save(validate: false)

      UserMailer.with(user: current_user).welcome_email.deliver_now
      render json: {
        success: true,
        user: current_user,
        active: false,
        message: 'active your email.'
      }, status: :unauthorized
    end

    def log_out_success
      render json: { message: 'You are logged out.' }, status: :ok
    end

    def log_out_failure
      render json: {
        success: false,
        message: 'Hmm nothing happened.'
      }, status: :unauthorized
    end
  end
end
