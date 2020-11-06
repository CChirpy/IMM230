require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "TShYz3tGDaUAQYVLK2ZrBe1xh"
  config.consumer_secret     = "CpkhPcbAlBIj06seikAFEjYohwpVSHyxdEMPVUe3TDKgk5ndw5"
  config.access_token        = "3942241996-mPBMqbKwOhw1Z46bQaCntmZ1efyjI3TrW8CKdIK"
  config.access_token_secret = "CW6rn1RG9QNlxaJFtUuBvXkAbH2u05EbAXFO60RpUOwiI"
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
