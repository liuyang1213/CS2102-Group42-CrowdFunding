class UsersController < ApplicationController
  def me
    @user = current_user
    render 'show'
  end

  def show
    @user = User.find(params[:id])
    redirect_to me if @user == current_user
  end
end
