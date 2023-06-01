class UsersController < ApplicationController
  def index
    @chefs = User.all
  end
end
