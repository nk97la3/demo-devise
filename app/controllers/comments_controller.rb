class CommentsController < ApplicationController
  before_action :find_cm_duty
  def new
    @comment = Comment.new
  end

def create

  if user_signed_in?
      @comment = @cm_duty.comments.new comment_params
      
      if @comment.save
        redirect_to @cm_duty and return if @cm_duty.class == Article
        redirect_to article_cmt @cm_duty and return
      else
        redirect_back fallback_location: root_path      
      end
    end
  end
 def destroy
    @comment = @cm_duty.comments.find(params[:id])
    if user_signed_in?
    	if current_user.email == @comment.commenter  
    		 @comment.destroy
    		 redirect_back fallback_location: root_path
    	end    	
    end
 
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
    def find_cm_duty
      @cm_duty= Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @cm_duty= Article.find_by_id(params[:article_id]) if params[:article_id]
    end
    #recursive to find article_id
    def article_cmt (comment)
      if comment.cm_duty == nil || comment.cm_duty.class == Article
        return comment.cm_duty
      end

      article_cmt(comment.cm_duty)
    end
end
