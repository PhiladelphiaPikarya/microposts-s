class UsersController < ApplicationController
  
  def show # 追加
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正 # user_url(@user) => 'http://example.com/users/3'
    else
      render 'new' # new.html.erbを返す
    end
  end
  
  def edit
    
  end
  
  def update
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :address, :area)
  end
end