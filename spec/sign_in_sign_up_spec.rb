# frozen_string_literal: true

feature 'Sign in user', js: true do
  credentials = YAML.safe_load(File.read('./creds.yml'))

  login = credentials.fetch(:user_name)
  password = credentials.fetch(:password)
  last_name = credentials.fetch(:last_name)
  email = credentials.fetch(:email)

  scenario 'User sign up failure' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.register').click

    find('#user_login').set login
    find('#user_password').set password
    find('#user_password_confirmation').set password
    find('#user_firstname').set login
    find('#user_lastname').set last_name
    find('#user_mail').set email

    find_button('Submit').click

    expect(page).to have_content('Email has already been taken')
    expect(page).to have_content('Login has already been taken')
  end

  scenario 'User sign up successful' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.register').click

    find('#user_login').set login
    find('#user_password').set password
    find('#user_password_confirmation').set password
    find('#user_firstname').set login
    find('#user_lastname').set last_name
    find('#user_mail').set email

    find_button('Submit').click

    expect(page).to have_content('Your account has been activated. You can now log in.')
  end

  scenario 'User sign in' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.login').click

    find('#username', wait: 100).set login
    find('#password').set password

    find_button('Login').click

    expect(page).to have_content('Home')
  end
end
