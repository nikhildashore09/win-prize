class RegistrationsController < ApplicationController

  def new
    @prizes = Prize.all
  end
  
end
