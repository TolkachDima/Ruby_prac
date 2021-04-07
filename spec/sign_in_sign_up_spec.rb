# frozen_string_literal: true

feature 'Sign in user', js: true do
  credentials = YAML.safe_load(File.read('./creds.yml'), [Symbol])

  login = credentials.fetch(:user_name)
  password = credentials.fetch(:password)
  last_name = credentials.fetch(:last_name)
  email = credentials.fetch(:email)

  scenario 'User sign up failure' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    @sign_up_page = RegisterPage.new

    @sign_up_page.register_link.click

    @sign_up_page.login.set login
    @sign_up_page.password.set password
    @sign_up_page.password_confirm.set password
    @sign_up_page.firstname.set login
    @sign_up_page.lastname.set last_name
    @sign_up_page.email.set email

    @sign_up_page.submit_btn.click

    expect(page).to have_content('Email has already been taken')
    expect(page).to have_content('Login has already been taken')
  end

  scenario 'User sign up successful' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    @sign_up_page = RegisterPage.new

    @sign_up_page.register_link.click

    @sign_up_page.login.set login
    @sign_up_page.password.set password
    @sign_up_page.password_confirm.set password
    @sign_up_page.firstname.set login
    @sign_up_page.lastname.set last_name
    @sign_up_page.email.set email

    @sign_up_page.submit_btn.click

    expect(page).to have_content('Your account has been activated. You can now log in.')
  end

  scenario 'User sign in' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    @sign_in_page = LoginPage.new

    @sign_in_page.login_link.click

    @sign_in_page.login.set login
    @sign_in_page.password.set password

    @sign_in_page.submit_btn.click

    # find('.login').click
    #
    # find('#username', wait: 100).set login
    # find('#password').set password
    #
    # find_button('Login').click

    expect(page).to have_content('Home')
  end
end
