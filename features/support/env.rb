
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
Cucumber::Rails::World.use_transactional_fixtures = false

if defined?(ActiveRecord::Base)
  begin
    require 'database_cleaner'
    DatabaseCleaner.strategy = :truncation
  rescue LoadError
  end
end

