class OutputsController < ApplicationController
 
  
  def new
    @outputs = Output.new
  end
  
   def show
     @outputs = Output.new
   end
  
  def create
    
    @outputs =Output.new(output_params)
     #raise.params.inspect
    if @outputs.save
       flash[:success]="投稿を作成しました"

       redirect_to "/outputs/index/#{@outputs.date}"
       
    else 
      flash[:danger]="記帳に失敗しました"
      @error_message="出金額又は入金額は必ず入力してください"
       render("outputs/new")   
    end
  end
   def index
      
     @users = User.find(@current_user.id)
    # @outputs = Output.where(date: Time.now.all_month).page(params[:page])
     
     @today =  Date.today
     
   if (params[:date]).blank?
      @this_month =Date.today
      @outputs = Output.where(date: Time.now.all_month).page(params[:page])
    else  
        @this_month =Date.parse(params[:date])
        @outputs= Output.where(date: @this_month.all_month)

      end
      @depo_sum = Output.group(:user_id).where(date: @this_month.all_month).sum(:deposit)   #総入金額
    @with_sum = Output.group(:user_id).where(date: @this_month.all_month).sum(:withdrawal)   #総出金額
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