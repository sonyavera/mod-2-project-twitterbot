class TweetsController < ApplicationController

    def new
        @tweet = Tweet.new
        if flash[:topic_id]
            @selected_topic = Topic.find(flash[:topic_id])
            @topics = Topic.all
        else
            @topics = Topic.all
        end
    end
=begin
#TODO
     - Take in the users category choice
     - Make a call to a Random - FactApi to get quote
     - Save the response 
     - Give the user a random twitter account to tweet at
     - Concatenate the fact api and twitter account in a tweet for the twitter bot to tweet 
     - Navigate the user to a preview page of the tweet they submitted  and link to the tweet
=end
    def getfact
         flash[:topic_id] = params[:topic]
         topicID = params[:topic]
         topic_name = Topic.find_by(id:topicID).name
         flash[:results] = FactsApi.get(topic_name)
         redirect_to new_tweet_path
    end


    
    def create 
        @tweet = Tweet.create(tweet_params)
        @tweet.user_id = session[:user_id]

        if @tweet.valid?
            redirect_to tweet_path(@tweet)
        else
            flash[:errors] = @tweet.errors.full_messages
            redirect_to new_tweet_path
        end
    end


    private

    def tweet_params
        params.require(:tweet).permit(:target_id, :user_id, :topic_id)
    end
end
