require 'rails_helper'

RSpec.describe RegistrationsController do
  describe 'GET #new' do
    it 'should render regitration page' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    let(:prize) { create(:prize) }
    it "should create user and user_opted_prize" do
      expect{
        post :create, params: { user: { email: "abc@yopmail.com", prize_id: prize.id } }
      }.to change{UserOptedPrize.count}.by(1)
    end

    it "should return valid message" do
      post :create, params: { user: { email: "abc@yopmail.com", prize_id: prize.id } }
      expect(flash[:success]).to match(/Thanks for signing up! Your odds of winning are 100.0%!/)
    end

    it 'should be able to opt for different prize' do
      user_opted_prize = create(:user_opted_prize)
      expect{
        post :create, params: { user: { email: user_opted_prize.user.email, prize_id: prize.id } }
      }.to change{UserOptedPrize.count}.by(1)
    end

    it "should return already opted message" do
      user_opted_prize = create(:user_opted_prize)
      post :create, params: { user: { email: user_opted_prize.user.email, prize_id: user_opted_prize.prize.id } }
      expect(flash[:alert]).to match(/You already opted for this prize./)
    end

    it "should not create user with invalid email" do
      post :create, params: { user: { email: 'abc', prize_id: prize.id } }
      expect(flash[:alert]).to match(/Please enter valid email address./)
    end

    it "should return error for not selected prize" do
      post :create, params: { user: { email: 'abc' } }
      expect(flash[:alert]).to match(/Please select prize./)
    end
  end
end