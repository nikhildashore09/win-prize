require 'rails_helper'

RSpec.describe Prize, type: :model do
  describe 'schema' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:user_opted_prizes) }
  end

  describe '#get_winning_chance_in_percent' do
    let(:prize) { create(:prize) }
    it 'should return expected percents' do
      create(:user_opted_prize, prize: prize)
      expect(prize.get_winning_chance_in_percent).to eq(100)
      create(:user_opted_prize, prize: prize)
      expect(prize.get_winning_chance_in_percent).to eq(50)
      create(:user_opted_prize, prize: prize)
      expect(prize.get_winning_chance_in_percent).to eq(33.33)
    end
  end
end
