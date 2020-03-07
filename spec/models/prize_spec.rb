require 'rails_helper'

RSpec.describe Prize, type: :model do
  describe 'schema' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
