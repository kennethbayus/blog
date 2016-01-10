class PostsController < ApplicationController

	before_action :require_user, except:[:index, :show]
	before_action :set_post, except:[:index, :new, :create]

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user

		if @post.save
  		flash[:notice] = "Your post was created successfully"
  		redirect_to posts_path
  	else
  		render :new
  	end

	end

	def show
		@comment = Comment.new
	end

	def edit
	end

	def update
	 	if @post.update(post_params)
  		flash[:notice] = "Post was updated successfully"
  		redirect_to post_path(@post)
  	else
  		render :edit
  	end

	end

	def destroy
		if @post.destroy
			flash[:notice] = "Post was deleted successfully"
  		redirect_to root_path
  	else
  		render :edit
  	end

	end

	def set_post
		@post = Post.find_by slug: params[:id]
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, {photos: []}, :tag_line, category_ids: [])
		end

end