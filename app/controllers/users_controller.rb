class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit,:update,:destroy,:show,:profile,:profile_new]}
  
  def new
    @users = User.new
  end
  
  def index
    @users = User.all
  end
  
  def login
    @users = User.find_by(email: params[:session][:email].downcase)
    
    if @users && @users.authenticate(params[:session][:password])
      session[:user_id]=@users.id
      flash[:success]="ログイン成功しました"
      redirect_to  user_path(@users) 
    else
      @error_message ="E-mail address or password is wrong"
      render("users/login_form") 
    end  
  end  
  
  def logout
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to("/login")
  end
  
  def create       
    #raise.params.inspect
    @users =User.new(user_params)
    
    if @users.save
      session[:user_id]=@users.id
      flash[:success]="ユーザー登録を完了しました"
      redirect_to user_path(@users) 
    else
      render "users/new" 
    end  
  end  
   
  def login_form
  end  
  
  def show
    @users = User.find_by(id: params[:id])
    @outputs = Output.new
    @with_sum = Output.group(:user_id).sum(:withdrawal)  
    @with_all_sum = Output.where(user_id: @current_user.id).group(:user_id).sum(:withdrawal)   #総出金額
    @depo_all_sum = Output.where(user_id: @current_user.id).group(:user_id).sum(:deposit)
  end
  
  def update
     #raise.params.inspect
    @users = User.find_by(id: params[:id])
  
    if  @users.update_attributes(user_params)
      flash[:success] = "ユーザー情報を編集しました"
      redirect_to user_path(@users)
    else
      render "users/edit"
    end
  end
  
  def profile_new
    @users=User.find_by(id: params[:id])
  end
  
  def profile
    #raise.params.inspect
    @users = User.find_by(id: params[:id])
   
    if  @users.update_attributes(user_params)
      flash[:success] = "基本設定を編集しました"
      redirect_to user_path(@users)
    else
      render "users/profile_new"
    end
  end
  
  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました。ご利用ありがとうございました。"
    redirect_to ("/login")
  end
  
  def ensure_correct_user
    @users=User.find_by(id: params[:id])
  
    if @users.id != @current_user.id
      flash[:danger]="権限がありません"
      redirect_to "/users/#{@current_user.id}"
    end
  end  
   
  private
  
  def user_params
    params.require(:user).permit(
    :name, :email, :password, 
    :password_confirmation,:monthly_budget,:monthly_savings,:thumbnail,:background,:total_asets)
  end
end