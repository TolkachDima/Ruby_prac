# frozen_string_literal: true

class LoginPage < SitePrism::Page
  element :login_link, '.login'

  element :login, '#username'
  element :password, '#password'

  element :submit_btn, :xpath, '//*[@id="login-submit"]'
end
