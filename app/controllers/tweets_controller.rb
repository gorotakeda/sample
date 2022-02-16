class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
   if @tweet.save
     redirect_to tweets_path, notice: "Tweet was successfully created"
   elsif 
     render :new
   end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
   if @tweet.update(tweet_params)
     redirect_to tweet_path, notice: "Tweet was successfully updated"
   elsif 
     render :edit
   end
  end

  def destroy
    
    if @tweet.destroy
      redirect_to tweets_path, notice: "Tweet was successfully destroied"
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:title, :body)

  end
  
end
