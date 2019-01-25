class InputsController < ApplicationController
 
  
  def new
    @inputs = Intput.new
  end
   def show
   
  end
  
  def create
    
    @inputs =Intput.new(input_params)
     #raise.params.inspect
    if @inputs.save
       redirect_to "/inputs/index"
       flash[:success]="投稿を作成しました"
    else 
       render("inputs/new")   
    end
  end
   def index
      
     @users = User.find_by(id: @current_user)
     @inputs = Intput.page(params[:page])
     
   end
 
    private
  
  def input_params
      params.require(:input).permit(
      :shop_name,:deposit,:date,:category).merge(user_id: @current_user.id)
  end
   
  
   
   
   
end