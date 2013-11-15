class UsersController < ApplicationController
	def index
		@user = current_user
		@tweets = current_user.tweets
		@tweet = Tweet.new
	end

	def all
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def follow
		@relationship = Relationships.new
		@user = User.find(params[:id])
		@relationship.follower_id = current_user.id
		@relationship.followed_id = @user.id
		@relationship.save!
		redirect_to root_path, alert: "You followed #{@user.name}"
	end

	# def create
	# 	@tweet = Tweet.new(tweet_params)
	# 	@tweet.user_id = current_user.id
 
	#   @tweet.save!
	#     redirect_to root_path
	# end

	# def destroy
	#  	@tweet = Tweet.find(params[:id])
	#  	@tweet.destroy

	# 	redirect_to users_path
	# end

	# private 

	 def user_params
	 	params.require(:user).permit(:name, :tweet, :bio)
	 end

end