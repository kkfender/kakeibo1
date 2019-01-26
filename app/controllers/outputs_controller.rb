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
       flash[:success]="投稿を作成しました"

       redirect_to "/outputs/index"
       
    else 
       render("outputs/new")   
    end
  end
   def index
      
     @users = User.find(@current_user.id)
     @outputs = Output.where(date: Time.now.all_month).page(params[:page])
     @with_sum = Output.group(:user_id).sum(:withdrawal)   #総出金額
     @depo_sum = Output.group(:user_id).sum(:deposit)   #総入金額
     @today =  Date.today
     
    if @this_month.present?
        @this_month =Date.today
      else
        
        @this_month = Date.parse(params[:date])
      end
       
   end
     def edit
    @outputs=Output.find_by(id: params[:id])
  end
  
  def update
    @outputs=Output.find_by(id: params[:id])
    if  @outputs.update_attributes(output_params)
   # raise.params.inspect
      flash[:notice]="投稿を編集しました"
      redirect_to("/outputs/index")
    else
      render("outputs/edit")   
    end
  end
      def destroy
    @outputs=Output.find_by(id: params[:id]) 
    if @outputs.destroy

      redirect_to("/outputs/index")
      flash[:notice]="投稿を削除しました"
    end
  end 
   
 
    private
  
  def output_params
    
      params.require(:output).permit(
      :shop_name,:withdrawal,:date,:category,:deposit).merge(user_id: @current_user.id)
  end
   
  
   
   
   
end