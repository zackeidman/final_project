class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:notice] = "Stop talking and start playing!"
			redirect_to @comment.smacktalk
		else
			flash[:alert] = @comment.errors.full_messages
			redirect_to "/comments"
    	
    	end

  end
	
	def new 
		@comment = Comment.new
	end 
	def edit 
	end
	def show
		@comment = Comment.find(params[:id])
	end
	def update
	end 
	def destroy
	end
end

private

  def comment_params
  	params.require(:comment).permit(:content, :smacktalk_id)

  end


