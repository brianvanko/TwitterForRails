class User < ActiveRecord::Base
	has_many :tweets, dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :followers, through: :relationship, source: :followers
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	
	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.image_url = auth.info.image
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save!
	  end
	end
end
