class CLikesController < ApplicationController
    def create
        c_like = current_user.c_likes.create(claimer_id: params[:claimer_id]) 
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        @abc = CLike.all
        c_like = @abc.find_by(claimer_id: params[:claimer_id], user_id: current_user.id)
        c_like.destroy
        redirect_back(fallback_location: root_path)
      end
end
