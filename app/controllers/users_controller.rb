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
  
   def show
    @users = User.find_by(id: params[:id])
     @inputs = Input.new
  end
  
   def update
     #raise.params.inspect
    @users = User.find_by(id: params[:id])
    if  @users.update_attributes(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to user_path(@users)
    else
      render "users/edit"
    end
  end
  
  def destroy 
    User.find(params[:id]).destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to ("/login")
  end
  
   def ensure_correct_user
    @users=User.find_by(id: params[:id])
    if @users.id !=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to user_path
    end
  end  
   
   
   
   
   
   
   
   
   
   
    private
  
  def user_params
      params.require(:user).permit(
      :name, :email, :password, 
      :password_confirmation)
  end
   
   
   
   
end