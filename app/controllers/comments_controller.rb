class  CommentsController <ApplicationController

		before_action :require_user, only: [:destroy]

		def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit(:body, :username, :email))

		if @comment.save
  		flash[:notice] = "Your comment was created"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = "Please check your comment submission for errors below"
  		render 'posts/show'
  	end

		end

		def destroy
		end

end