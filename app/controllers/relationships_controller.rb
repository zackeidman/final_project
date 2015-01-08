class RelationshipsController < ApplicationController
	def create
		@relationship = current_user.relationships.create(following_id: params[:relationship][:following_id])
		redirect_to root_path
	end

	def destroy
		@relationship = Relationship.find(params[:id])
		@relationship.destroy
		redirect_to root_path
	end
end
