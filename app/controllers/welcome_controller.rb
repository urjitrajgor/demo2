class WelcomeController < ApplicationController
  def index
    @information = "Welcome Guest"
  end

  def deshboard
    @user = User.find(params[:id])
    
  end


  

end
