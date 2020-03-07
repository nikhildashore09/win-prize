require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
  end
end