class InputsController < ApplicationController
 
  
  def new
    @inputs = Input.new
  end
   def show
   
  end
  
  def create
    
    @inputs =Input.new(input_params)
     #raise.params.inspect
    if @inputs.save
       redirect_to "/inputs/index"
       flash[:notice]="投稿を作成しました"
    else 
       render("inputs/new")   
    end
  end
   def index
      #raise.params.inspect
     @users = User.find_by(id: @current_user)
     @inputs = Input.page(params[:page])
    
   end
 
    private
  
  def input_params
      params.require(:input).permit(
      :shop_name,:withdrawal,:date).merge(user_id: @current_user.id)
  end
   
  
   
   
   
end