class PostsController < ApplicationController
	def index
		@posts = Post.all
		@posts = @posts.paginate(page:  params[:page], per_page:  6)
	end

	def show
		@post = Post.friendly.find(params[:id])
	end
end
