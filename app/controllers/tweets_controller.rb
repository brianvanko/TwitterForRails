class TweetsController < ApplicationController

	def index
		@tweets = current_user.tweets
		@tweet = Tweet.new
	end

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user_id = current_user.id
 
	  @tweet.save!
	    redirect_to root_path
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy

		redirect_to root_path
	end

	def update
	end

	def show
		@tweet = Tweet.find(param[:id])
	end

	private 

	def tweet_params
		params.require(:tweet).permit(:body)
	end
end
