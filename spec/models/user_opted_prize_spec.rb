require 'rails_helper'

RSpec.describe UserOptedPrize, type: :model do
  describe 'schema' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:prize_id).of_type(:integer) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:prize_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:prize) }
  end
end