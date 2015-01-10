class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end
	def create
	end
	def new 
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
