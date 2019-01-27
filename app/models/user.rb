class User < ApplicationRecord
  has_secure_password
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
   validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
   validates :name,presence: true, length: { maximum: 8 }
  
  
   def outputs
    return  Output.where(user_id: self.id)
  end  
  
  def outputs_day
    search_date = Date.today
    return  Output.where(user_id: self.id).where(date: search_date.in_time_zone.all_day)
  end  
  
   def outputs_month
    search_date = Date.today
    return  Output.where(user_id: self.id).where(date: search_date.in_time_zone.all_month)
  end  
  
   def outputs_year
    search_date = Date.today
    return  Output.where(user_id: self.id).where(date: search_date.in_time_zone.all_year)
  end  
  
  def outputs_day_with
    search_date = Date.today
    return  Output.where(user_id: self.id).where(date: search_date.in_time_zone.all_day).group(:user_id).sum(:withdrawal)
  end  
  
   def outputs_month_with
    search_date = Date.today
    return  Output.where(user_id: self.id).where(date: search_date.in_time_zone.all_month).group(:user_id).sum(:withdrawal)
  end  
    
    
   def last_day
   today = Date.today
  last_day = Date.new(today.year, today.month, -1)
 
  return (last_day - today)
    
  end
  
  


end
 

