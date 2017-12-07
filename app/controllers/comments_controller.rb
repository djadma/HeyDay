class CommentsController < ApplicationController
	before_action :set_post, only: [:new, :create]

	def create
		@comment = @post.comments.new(comment_params)
		if @comment.save
		 	redirect_to post_path(@post)
		else
			redirect_to root_path
		end
	end

	protected
	def comment_params
	  params.require(:comment).permit(:message, :name, :email, :post_id)
	end

	def set_post
		@post = Post.friendly.find(params[:post_id])
	end
end
