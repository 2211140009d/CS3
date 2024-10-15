class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    signup_password = BCrypt::Password.create(params[:user][:pass])
    w = User.new(uid: params[:user][:uid], pass: signup_password) # 正しい変数名を使用
    w.save
    redirect_to users_path
  end
end

