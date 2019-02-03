class User < ApplicationRecord
  has_secure_password
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
   validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
   validates :name,presence: true, length: { maximum: 10 }
 validates :monthly_budget,presence: true 
 validates :monthly_savings,presence: true 
 validates :total_asets,presence: true

  has_many :usersbudges ,dependent: :destroy
  has_many :outputs ,dependent: :destroy
  has_many :budges, through: :usersbudges
  accepts_nested_attributes_for :usersbudges
  
  mount_uploader :thumbnail, ThumbnailUploader
   mount_uploader :background, BackgroundUploader



  
  
   def outputs
    return  Output.where(user_id: self.id)
  end  
  
  def outputs_day
    search_date = Date.today
    return  Output.where(user_id: self.id,date: search_date.in_time_zone.all_day)
  end  
  
   def outputs_month
    search_date = Date.today
    return  Output.where(user_id: self.id,date: search_date.in_time_zone.all_month)
  end  
  
  def outputs_day_category
    search_date = Date.today
    return  Output.where(date: search_date.in_time_zone.all_month,user_id: self.id,).group(:category).sum(:withdrawal)
  end   
  
  def outputs_day_revenue_item
    search_date = Date.today
    return  Output.where(date: search_date.in_time_zone.all_month,user_id: self.id,).group(:revenue_item).sum(:deposit)
  end  

  
   def outputs_year
    search_date = Date.today
    return  Output.where(date: search_date.in_time_zone.all_year)
  end  
  
  def outputs_day_with
    search_date = Date.today
    return  Output.where(user_id: self.id).where(date: search_date.in_time_zone.all_day).group(:user_id).sum(:withdrawal)
  end  
  
   def outputs_month_with
    search_date = Date.today
    return  Output.where(user_id: self.id).where(date: search_date.in_time_zone.all_month).group(:user_id).sum(:withdrawal)
  end  
    
    def youbi
    youbi = %w[日 月 火 水 木 金 土]
   end
    
   def last_day
   today = Date.today
  last_day = Date.new(today.year, today.month, -1)
 
  return (last_day - today)
    
  end
  
  


end
 

