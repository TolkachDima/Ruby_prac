# frozen_string_literal: true

require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

require_relative '../page_objects/register_page'
require_relative '../page_objects/login_page'

RSpec.configure do |_config|
  def options
    Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
  end

  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end
