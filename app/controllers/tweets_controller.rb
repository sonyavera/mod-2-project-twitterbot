class TweetsController < ApplicationController

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = Tweet.create(tweet_params)
        if @tweet.valid?
            redirect_to tweet_path(@tweet)
        else
            flash[:errors] = @tweet.errors.full_messages
            redirect_to new_tweet_path
        end
    end


    private

    def tweet_params
        params.require(:tweet).permit(:target_id, :user_id)
    end
end
