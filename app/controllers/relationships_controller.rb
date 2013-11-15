class RelationshipsController < ApplicationController
	def new
		@relationship = Relationships.new
		@user = User.find(params[:followed_user])
		@relationship.follower_id = current_user.id
		@relationship.followed_id = @user.id
		@relationship.save!
		redirect_to root_path, alert: "You followed #{@user.name}"
		
	end
end
