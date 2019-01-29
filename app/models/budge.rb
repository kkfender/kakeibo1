class Budge < ApplicationRecord
   has_many :usersbudges
  has_many :users, through: :usersbudges
  
    accepts_nested_attributes_for :usersbudges


end
