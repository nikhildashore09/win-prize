class Prize < ApplicationRecord
  #associations
  has_many :user_opted_prizes

  #validations
  validates :name, presence: true, uniqueness: true
end
