class PostsController < ApplicationController
	def index
		@posts = Post.all
		@posts = @posts.paginate(page:  params[:page], per_page:  6)
	end

	def show
		@post = Post.friendly.find(params[:id])
		@recent_posts = Post.friendly.recent
	end
end
