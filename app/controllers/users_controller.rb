class UsersController < ApplicationController
  
  def index
    @user = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "アカウント登録が完了しました"
      redirect_to @user
      
    else
      render 'root_path'
    end
  end
end
