require 'rails_helper'

RSpec.describe RegistrationsController do
  describe 'GET #new' do
    it 'should render regitration page' do
      get :new
      expect(response).to be_success
    end
  end
end