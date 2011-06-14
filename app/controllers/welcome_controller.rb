class WelcomeController < ApplicationController
  def index
    @accounts = Account.all
  end
end
