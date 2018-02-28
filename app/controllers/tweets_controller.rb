class TweetsController < ApplicationController
  before_action :set_params, only:[:show, :edit, :destroy, :update]

  def index
    @tweets = Tweet.all
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "ツイートを投稿しました"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "ツイートを編集しました"
    else
      render "edit"
    end
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "ツイートを削除しました"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_params
    @tweet = Tweet.find(params[:id])
  end

end
