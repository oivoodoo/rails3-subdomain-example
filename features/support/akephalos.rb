require 'akephalos'
Capybara.default_driver = :akephalos
Capybara.app_host = 'http://lvh.me:3001'
Capybara.server_port = 3001
Capybara.ignore_hidden_elements = true