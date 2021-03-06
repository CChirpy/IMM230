require 'simplehttp'
require 'json'
require 'ostruct'
require 'awesome_print'
require 'open-uri'
require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

# define
def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def @client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 50, include_rts: false}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end

# @client.get_all_tweets("CChirpy_").each do |tweet|
#     puts tweet.text
# end

# @client.home_timeline.each do | tweet |
#     puts tweet.text
# end

# @client.user_timeline("CChirpy_").each do |tweet|
#     puts tweet.text
# end

# @client.followers("CChirpy_").each do |follower|
#         puts follower.email
# end

# tweet
# @client.update("test")
