class TweetsController < ApplicationController
    before_action :set_tweet, only: [:show]

    @@result = nil
    @@topic_saved = nil
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
         @@topic_saved = params[:topic]
         topicID = params[:topic]
         topic_name = Topic.find_by(id:topicID).slug
         flash[:results] = FactsApi.get(topic_name)
         @@result = set_tweet_content_length(flash[:results])
         redirect_to new_tweet_path
    end

    
    def set_tweet_content_length(content)
        content_length = content.length
        if content_length <= 280
            content
        else
            edited_content = content
            until edited_content.length <= 280 do
                content_array = edited_content.split(". ")   
                content_array.pop
                edited_content = content_array.join(". ")
            end
            edited_content + "."
        end
    end

    def index
        @tweets = Tweet.all.select do |tweet|
                  tweet.user_id == session[:user_id]
                  end 
        @tweets_html = @tweets.map do |tweet|
                            GetTweets.get_a_tweet(tweet.status_number) 
                       end
    end 

    def generatetweet
        target = Target.all.sample
        flash[:tweet_success] = "Nice tweet! Let's send it out."
        bot_response = Bot.update("@#{target.handle} #{@@result}")
        @tweet = Tweet.create(target_id: target.id, user_id: session[:user_id], topic_id: @@topic_saved, status_number: bot_response.id)
        redirect_to tweet_path(@tweet)
    end

    def show
        @tweet_html = GetTweets.get_a_tweet(@tweet.status_number)
    end

    private

    def tweet_params
        params.require(:tweet).permit(:target_id, :user_id, :topic_id, :status_number)
    end

    def set_tweet
        @tweet = Tweet.find(params[:id])
    end
end
