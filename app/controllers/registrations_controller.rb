class RegistrationsController < ApplicationController
  before_action :find_prize, only: :create

  def new
    @prizes = Prize.all
  end

  def create
    user = User.find_or_initialize_by(email: params[:user][:email])
    if user.valid?
      user.user_opted_prizes.new(prize: @prize)
      if user.save
        winning_percent = @prize.get_winning_chance_in_percent
        flash[:success] = "Thanks for signing up! Your odds of winning are #{winning_percent}%!"
      else
        flash[:alert] = "You already opted for this prize."
      end
    else
      flash[:alert] = "Please enter valid email address."
    end
    redirect_to root_path
  end

  private
  def find_prize
    @prize = Prize.find_by(id: params[:user][:prize_id])
    if @prize.nil?
      flash[:alert] = 'Please select prize.'
      redirect_to root_path
    end
  end
end
