class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit,:update,:destroy]}
  
  def new
    @users = User.new
  end
  
  def login
      @users = User.find_by(email: params[:session][:email].downcase)
    if @users && @users.authenticate(params[:session][:password])
      session[:user_id]=@users.id
      flash[:notice]="ログイン成功しました"
      redirect_to("/users/index")
    else
      @error_message ="E-mail address or password is wrong"
      render("users/login_form") 
    end  
  end  
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
  def create        
    #raise.params.inspect
    @users =User.new(user_params)
    if @users.save
      session[:user_id]=@users.id
      flash[:notice]="ユーザー登録を完了しました"
      redirect_to users_path(@users) 
    else
    render "users/new" 
    end  
  end  
   
  def login_form
  end  
   
   
   
   
   
   
   
   
   
   
   
   
   
    private
  
  def user_params
      params.require(:user).permit(
      :name, :email, :password, 
      :password_confirmation)
  end
   
   
   
   
end