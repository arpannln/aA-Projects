class TweetsController < ApplicationController
  before_action :require_logged_in!

  def create
    # simulate latency
    sleep(1)

    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to request.referrer
    else
      # Lazy: even respond with JSON to invalid HTML request.
      respond_to do |format|
        format.html { render :create }
        format.json { render :create }
      end
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, mentioned_user_ids: [])
  end
end
