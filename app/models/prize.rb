class Prize < ApplicationRecord
  #associations
  has_many :user_opted_prizes

  #validations
  validates :name, presence: true, uniqueness: true

  def get_winning_chance_in_percent
    (100.0 / user_opted_prizes.count).round(2)
  end
end
