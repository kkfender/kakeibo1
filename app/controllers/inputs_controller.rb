class InputsController < ApplicationController
 
  
  def new
    @inputs = Input.new
  end
   def show
   
  end
  
  def create
    
    @inputs =Input.new(input_params)
    if @inputs.save
       redirect_to "/inputs/index"
       flash[:notice]="投稿を作成しました"
    else 
       render("inputs/new")   
    end
  end
   def index
      #raise.params.inspect
     
     @inputs = Input.find_by(user_id: params[:user_id])
     
   end
 
    private
  
  def input_params
      params.require(:input).permit(
      :shop_name).merge(user_id: @current_user.id)
  end
   
  
   
   
   
end