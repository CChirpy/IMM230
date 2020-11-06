=begin
  Instructions:
    1. Use an API
    2. Add Sinatra to the project
    3. Add a form to get the search input from the user
    4. Add another route and ERB file to display the results
  Resources:
    - https://www.rubyguides.com/2016/04/twitter-api-from-ruby-tutorial/
    - https://github.com/sferik/twitter#streaming
    - http://nizhu.github.io/ruby-intro-site/blog/2013/08/01/accessing-the-twitter-api/
=end

require 'sinatra'
require 'json'
require 'twitter'
require 'open-uri'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

before do
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "YOUR_CONSUMER_KEY"
    config.consumer_secret     = "YOUR_CONSUMER_SECRET"
    config.access_token        = "YOUR_ACCESS_TOKEN"
    config.access_token_secret = "YOUR_ACCESS_SECRET"
  end
end

get '/' do
  erb :index
end

post '/search' do
  user_input = params['user_input']
  @client.search("user_input -rt", :count => 100, result_type: "popular").take(5).collect do |tweet|
    "#{tweet.user.screen_name}: #{tweet.text}"
  end
  erb :form
end
