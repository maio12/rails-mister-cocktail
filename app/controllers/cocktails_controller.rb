class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create

    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Your cocktail was successfully created'
    else
      render :new, alert: 'Your cocktail sucked'
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.destroy
      redirect_to cocktails_path, notice: 'Your cocktail was successfully killed'
    else
      redirect_to :back
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
