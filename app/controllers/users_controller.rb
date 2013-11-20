class UsersController < ApplicationController
	def index
		if current_user != nil
			@user = current_user
			@tweets = current_user.tweets
			@tweet = Tweet.new

			@followeds = Relationships.where(:follower_id => current_user.id)
			followeds_ids = @followeds.map(&:followed_id)
			@followed_tweets = Tweet.find_all_by_user_id followeds_ids
			# @followed_tweets = Tweet.where(:user_id => @followeds.find(params[:followed_id]))
		end

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

	def createbio
		@bio = User.update()
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