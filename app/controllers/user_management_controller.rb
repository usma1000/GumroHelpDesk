class UserManagementController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def toggle_admin
    user = User.find params[:id]
    user.toggle!(:admin)
    redirect_to :back
  end

end
