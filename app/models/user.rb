class User < ApplicationRecord
  #validations
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end