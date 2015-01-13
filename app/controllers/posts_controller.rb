class PostsController < ApplicationController
	
	before_filter :authenticate_user!

	def new
		@post = current_user.posts.build
	end 

	def create
		@post = current_user.posts.create(post_params)

		if @post.save
			flash[:notice] = "You have created a post"
			redirect_to @post.recipient
		else 
			flash[:alert] = "Error, Didn't save anything. Please try again."
			render 'new'
	end
end 


	def edit
		@post = Post.find(params[:id])
		allow_owner

	end

	def update
		@post = Post.find(params[:id]) 
		allow_owner
		redirect_to root_path unless current_user == @post.user
		if @post.update_attributes(post_params)
			redirect_to root_path
			flash[:notice] = "You have successfully edited the post"
		else 
			render 'edit'
			flash[:alert] = "Uh oh! Something went wrong"
	end
end 

	def destroy
		@post = Post.find(params[:id])
		allow_owner
		@post.destroy
		redirect_to root_path
	end 	


	private
		def post_params
			params.require(:post).permit(:content, :recipient_id)
		end 

		def allow_owner
			redirect_to root_path unless current_user == @post.user
		end
end

