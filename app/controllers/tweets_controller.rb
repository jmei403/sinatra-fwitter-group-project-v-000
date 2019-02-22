class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      erb :'/tweets/tweets'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/new'
    else
      redirect "/login"
    end
  end

  post '/tweets' do
    if !params[:tweet][:content].empty?
      @tweet = Tweet.create(params[:tweet])
      @tweet.user_id = session[:user_id]
      @tweet.save
    end
    binding.pry
    redirect "/tweets/#{@tweet.id}"
  end

  get '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    erb :'/tweets/show_tweet'
  end

  # get 'tweets/:id/edit' do
  #
  # end
end
