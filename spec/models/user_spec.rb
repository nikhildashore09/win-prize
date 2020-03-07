require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
  end

  describe 'associations' do
    it { should have_many(:user_opted_prizes) }
  end
end