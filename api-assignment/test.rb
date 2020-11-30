require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

# @client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
#   "#{tweet.user.screen_name}: #{tweet.text}"
# end

# client.followers("CChirpy_").each do |follower|
#     puts follower.name
# end

# client.search("from:CChirpy_", result_type: "recent").take(5).each do |tweet|
#   puts tweet.text
# end

# client.search("#cats", result_type: "recent").take(5).each do |tweet|
#   puts tweet.text
# end

tweets = []
i = 0
user_input = "dogs"
client.search("##{user_input}", result_type: "mixed").take(3).each do |tweet|
  tweets[i] = tweet.text
  i = i + 1
end

tweets.each do |item|
    puts item
end
