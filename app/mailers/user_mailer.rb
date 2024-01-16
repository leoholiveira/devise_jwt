# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "#{@user.username} - Active your account")
  end

  def forgot_password
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "#{@user.username} - Forgot password")
  end
end
