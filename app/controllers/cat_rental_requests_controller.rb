class CatRentalRequestsController < ApplicationController
    #* section user interface
    def new
        render :new
    end
    #* section API
    def create
        req = CatRentalRequest.create!(cat_rental_request_params)
        if req
            redirect_to cat_url(req.cat_id)
        else
            redirect_to '/'
        end
    end

    private
    def cat_rental_request_params
        params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date)
    end
end
