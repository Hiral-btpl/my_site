class HomesController < ApplicationController
  def index
    @users = User.all
    @user = User.last
  end
end
