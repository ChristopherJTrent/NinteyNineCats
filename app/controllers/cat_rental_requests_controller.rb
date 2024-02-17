class CatRentalRequestsController < ApplicationController
    #* section user interface
    def new
        if params[:cat_id]
            @cat = Cat.find_by(id: params[:cat_id])
        else
            @cats = Cat.all
        end
        render :new
    end
    #* section API
    def create
        req = CatRentalRequest.create!(cat_rental_request_params)
        if req
            redirect_to cat_url(params[:cat_id])
        else
            redirect_to '/'
        end
    end

    private
    def cat_rental_request_params
        # construct a hash that contains the cat id, start date, and end date.
        params.require(:cat_rental_requests)
                .permit(:start_date, :end_date)
                .merge({cat_id: params[:cat_id]})
        
    end
end
