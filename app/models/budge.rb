class Budge < ApplicationRecord
   has_many :usersbudges
  has_many :users, through: :usersbudges

end
