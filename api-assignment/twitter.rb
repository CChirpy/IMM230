=begin
  Instructions:
    1. Use an API
    2. Add Sinatra to the project
    3. Add a form to get the search input from the user
    4. Add another route and ERB file to display the results
  Resources:
    - https://github.com/sferik/twitter
    - https://developer.twitter.com/en/docs/labs/recent-search/guides/search-queries
    - https://stackoverflow.com/questions/17118380/pulling-images-from-users-timeline-with-twitter-gem
    - https://medium.com/craft-academy/twitter-gem-58fdbe4788e0
    - https://stackoverflow.com/questions/8425366/displaying-tweets-in-my-view/8426388#8426388
=end

require 'sinatra'
require 'json'
require 'twitter'
require 'open-uri'
require 'simplehttp'
require 'ostruct'
require 'awesome_print'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

before do
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = 
    config.consumer_secret     = 
    config.access_token        = 
    config.access_token_secret = 
  end
end

get '/' do
  erb :index
end

post '/search' do
  @tweets = []
  i = 0
  user_input = params["user_input"]

  @client.search("##{user_input}", result_type: "mixed").take(3).each do |tweet|
    @tweets[i] = tweet.text
    i = i + 1
  end

  erb :form
end
