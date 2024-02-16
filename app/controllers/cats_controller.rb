class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end
  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end
  def update
  
  end
  def create

  end
  def new

  end
  def edit

  end
  private
    # Only allow a list of trusted parameters through.
    def cat_params
      params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end
