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
    if Output.where(user_id: @current_user.id).count==1 
      flash[:info] = "初記帳ありがとうございます。[初記帳]バッジを獲得しました"
      Usersbudge.create(user_id: @current_user.id,budge_id: 1)
      
    end
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
      @outputs = Output.where(date: Time.now.all_month)
      .where(user_id: @current_user.id).page(params[:page]).per(20).order("date desc")

    else  
        @this_month =Date.parse(params[:date])
        @outputs= Output.where(date: @this_month.all_month)
        .where(user_id: @current_user.id).page(params[:page]).per(20).order("date DESC")

      end
    @with_sum = Output.group(:user_id).where(date: @this_month.all_month).sum(:withdrawal)   #総出金額
  end
     def edit
    @outputs=Output.find_by(id: params[:id])
  end
  
  def update
    @outputs=Output.find_by(id: params[:id])
    if  @outputs.update_attributes(output_params)
   # raise.params.inspect
      flash[:success]="投稿を編集しました"
      redirect_to("/outputs")
    else
      render("outputs/edit")   
    end
  end
      def destroy
    @outputs=Output.find_by(id: params[:id]) 
    if @outputs_d= Output.where(user_id: @current_user.id).count==1 
      @budges =  Usersbudge.find_by(user_id: @current_user.id,budge_id: 1)
      @budges.destroy
    end
    if @outputs.destroy
      
      redirect_to("/outputs")
      flash[:success]="投稿を削除しました"
    
    end
  end 
  
    
 
 
    private
  
  def output_params
    
      params.require(:output).permit(
      :shop_name,:withdrawal,:date,:category,:deposit,:memo).merge(user_id: @current_user.id)
  end
   
  
   
   
   
end