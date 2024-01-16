# frozen_string_literal: true

# app/controllers/users/registrations_controller.rb
module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :birthdate, :ddd, :phone)
    end

    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?

      register_failed
    end

    def register_success
      current_user.confirmation_token = 6.times.map { rand(9) }.join
      current_user.save(validate: false)

      UserMailer.with(user: current_user).welcome_email.deliver_now

      render json: {
        success: true,
        message: 'active your email.',
        user: resource
      }, status: :ok
    end

    def register_failed
      render json: {
        success: false,
        message: resource.errors.full_messages.first
      }, status: :unprocessable_entity
    end
  end
end
