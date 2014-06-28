class ProfilesController < ApplicationController
  before_action :authorize, only: [:index, :edit]

  def index
    @current_fashionista = Fashionista.find(session[:fashionista_id])
  end

  def edit
    @current_fashionista = Fashionista.find(session[:fashionista_id])
  end

  private  
  def fashionista_params
    params.require(:fashionista).permit(:username, :email, :tagline, :pic_url, :budget, :size, :style_id, :password, :password_confirmation)  
  end   

end
