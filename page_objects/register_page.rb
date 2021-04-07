# frozen_string_literal: true

class RegisterPage < SitePrism::Page
  element :register_link, '.register'
  element :login_link, '.login'

  element :login, '#user_login'
  element :password, '#user_password'
  element :password_confirm, '#user_password_confirmation'
  element :firstname, '#user_firstname'
  element :lastname, '#user_lastname'
  element :email, '#user_mail'
  element :submit_btn, '#new_user > input[type=submit]:nth-child(4)'
end
