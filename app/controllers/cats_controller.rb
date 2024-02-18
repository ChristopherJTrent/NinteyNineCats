class CatsController < ApplicationController
  # * section: user interface
  def index
    @cats = Cat.all
    render :index
  end
  def show
    @cat = Cat.find_by(id: params[:id])
    @requests = CatRentalRequest.where(cat_id: params[:id]).order(:start_date)
    render :show
  end
  def new

  end
  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  # * section: API
  def update
    cat = Cat.find_by(id: params[:id])
    cat.update(cat_params)
    redirect_to cat_url(params[:id])
  end
  def create
    @cat = Cat.create!(cat_params)
    render :show 
  end

  private
    # Only allow a list of trusted parameters through.
    def cat_params
      params.require(:cats).permit(:birth_date, :color, :name, :sex, :description)
    end
end
