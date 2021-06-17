class CCommentsController < ApplicationController
    before_action :authenticate_user!

  def create
    claimer = Claimer.find(params[:claimer_id])
    c_comment = claimer.c_comments.build(comment_params) 
    c_comment.user_id = current_user.id
    if c_comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def comment_params
      params.require(:c_comment).permit(:content)
    end
end
