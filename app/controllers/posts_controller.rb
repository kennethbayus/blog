class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
  		flash[:notice] = "Your post was created successfully"
  		redirect_to posts_path
  	else
  		render :new
  	end

	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

	 	if @post.update(post_params)
  		flash[:notice] = "Post was updated successfully"
  		redirect_to posts_path(@post)
  	else
  		render :edit
  	end

	end

	def destroy
		@post = Post.find(params[:id])

		if @post.destroy
			flash[:notice] = "Post was deleted successfully"
  		redirect_to root_path
  	else
  		render :edit
  	end

	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end

end