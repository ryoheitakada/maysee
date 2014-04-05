class WelcomeController < ApplicationController
  before_filter :set_user
  def index
  end

  def set_user
    @user = current_user || @user || User.new
  end
end
