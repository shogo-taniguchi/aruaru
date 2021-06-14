class ClaimersController < ApplicationController
    before_action :authenticate_user!
    def index
        @claimers = Claimer.all
    end

    def new
        @claimer = Claimer.new
    end

    def create
        claimer = Claimer.new(claimer_params)
        if claimer.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @claimer = Claimer.find(params[:id])
    end
    
    def edit
        @claimer = Claimer.find(params[:id])
    end

    def update
        claimer = Claimer.find(params[:id])
        if claimer.update(claimer_params)
          redirect_to :action => "show", :id => claimer.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        claimer = Claimer.find(params[:id])
        claimer.destroy
        redirect_to action: :index
    end

    private
    def claimer_params
        params.require(:claimer).permit(:body_c)
    end
end
