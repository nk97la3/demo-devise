class CommentsController < ApplicationController
  before_action :find_cm_duty
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

def create

  if user_signed_in?
      @comment = @cm_duty.comments.new comment_params
      
      if @comment.save
        redirect_to @cm_duty and return if @cm_duty.class == Product
        redirect_to product_cmt @cm_duty and return
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
      @cm_duty= Product.find_by_id(params[:product_id]) if params[:product_id]
    end
    #recursive to find article_id
    def product_cmt (comment)
      if comment.cm_duty == nil || comment.cm_duty.class == Product
        return comment.cm_duty
      end

      product_cmt(comment.cm_duty)
    end
end
