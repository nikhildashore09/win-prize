class User < ApplicationRecord
  #associations
  has_many :user_opted_prizes

  #validations
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end