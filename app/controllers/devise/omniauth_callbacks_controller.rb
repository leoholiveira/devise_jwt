# app/controllers/users/sessions_controller.rb
class Devise::OmniauthCallbacksController
  # Sets flash message if is_flashing_format? equals true
  def set_flash_message!(key, kind, options = {})
    if Devise.navigational_formats.include?(request_format)
      set_flash_message(key, kind, options)
    end
  end
end