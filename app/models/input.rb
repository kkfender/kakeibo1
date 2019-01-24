class Input < ApplicationRecord
  
    def user
    return  User.find_by(id: self.user_id)
     end
  
end
