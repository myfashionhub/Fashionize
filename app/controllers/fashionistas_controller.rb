class FashionistasController < ApplicationController

  def index
    @fashionista  = current_fashionista
    @fashionistas = Fashionista.all
  end


  def new
    @fashionista = Fashionista.new
  end


  def create
    @fashionista = Fashionista.new(fashionista_params)
    if @fashionista.save
      session[:fashionista_id] = @fashionista.id
      redirect_to "/profile",
      notice: "Profile successfully created."
    else
      render 'new'
    end
  end


  def edit
    @current_fashionista = Fashionista.find(session[:fashionista_id])
  end


  def update
    @current_fashionista = Fashionista.find(session[:fashionista_id])
    @current_fashionista.update(fashionista_params)

    redirect_to '/profile'
  end


  def show
    @fashionista = Fashionista.find(params[:id])
    @style       = Style.find(@fashionista.style_id)
    saves       = Save.where(fashionista_id: @fashionista.id)
    @items      = saves.map do |save|
      Item.find(save.item_id)
    end
    @items.sort_by { |item| item.created_at }
  end


  def destroy
    Fashionista.delete(current_fashionista.id)
    session[:fashionista_id] = nil
    redirect_to root_path
  end


  private
  def fashionista_params
    params.require(:fashionista).permit(:username, :email, :tagline, :pic_url, :budget, :size, :style_id, :password, :password_confirmation)
  end

end
