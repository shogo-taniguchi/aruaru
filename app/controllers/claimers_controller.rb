class ClaimersController < ApplicationController
    before_action :authenticate_user!
    def index
        if params[:search] != nil && params[:search] != ''
            search = params[:search]
            @claimers = Claimer.joins(:user).where("body_c LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
        else
            @claimers = Claimer.all
        end
        @rank_claimers = Claimer.all.sort {|a,b| b.c_liked_users.count <=> a.c_liked_users.count}
    end

    def new
        @claimer = Claimer.new
    end

    def create
        claimer = Claimer.new(claimer_params)
        claimer.user_id = current_user.id
        if claimer.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @claimer = Claimer.find(params[:id])
        @c_comments = @claimer.c_comments
        @c_comment = CComment.new
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
