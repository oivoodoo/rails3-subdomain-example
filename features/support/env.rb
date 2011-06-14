
ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

require 'cucumber/rails'
require 'cucumber/formatter/unicode'
require 'cucumber/rails/world'
require 'cucumber/web/tableish'

require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'

Capybara.default_selector = :css

ActionController::Base.allow_rescue = false
Cucumber::Rails::World.use_transactional_fixtures = true

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

