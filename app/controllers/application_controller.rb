class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  before_action :set_current_user
  protect_from_forgery
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  
  def authenticate_user
    if @current_user == nil
      flash[:info] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def forbid_login_user
    if@current_user
      flash[:info]="すでにログインしています"
      redirect_to users_path
    end
  end
end
