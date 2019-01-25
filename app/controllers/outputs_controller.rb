class OutputsController < ApplicationController
 
  
  def new
    @outputs = Output.new
  end
   def show
   
  end
  
  def create
    
    @outputs =Output.new(output_params)
     #raise.params.inspect
    if @outputs.save
       redirect_to "/outputs/index"
       flash[:success]="投稿を作成しました"
    else 
       render("outputs/new")   
    end
  end
   def index
      
     @users = User.find_by(id: @current_user.id)
     @outputs = Output.page(params[:page])
     @withdrawals = Output.where(id: @current_user)
  
     
   end
     
     
   
 
    private
  
  def output_params
    
      params.require(:output).permit(
      :shop_name,:withdrawal,:date,:category,:deposit).merge(user_id: @current_user.id)
  end
   
  
   
   
   
end