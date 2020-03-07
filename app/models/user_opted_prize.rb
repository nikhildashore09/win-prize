class UserOptedPrize < ApplicationRecord
  #associations
  belongs_to :prize
  belongs_to :user
  
  #validations
  validates :user_id, uniqueness: { scope: :prize_id }
end
