class PostLikesController < ApplicationController
    def create
        post_like = current_user.post_likes.create(post_id: params[:post_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @abc = PostLike.all
        post_like = @abc.find_by(post_id: params[:post_id], user_id: current_user.id)
        post_like.destroy
        redirect_back(fallback_location: root_path)
    end
    
end
