class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
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
      if @user.update(user_params)
      # 保存に成功した場合はユーザートップページへリダイレクト
      flash[:success] = "メッセージを編集しました"
      redirect_to @user 
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :address, :area)
  end
  
    def set_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to  (root_path)
   end
end
end