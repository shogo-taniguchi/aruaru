class PCommentsController < ApplicationController
    before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    p_comment = post.p_comments.build(p_comment_params) 
    p_comment.user_id = current_user.id
    if p_comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def p_comment_params
      params.require(:p_comment).permit(:content)
    end
end
