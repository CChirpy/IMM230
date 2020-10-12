require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions

before do
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
  @result = ""
  @wins ||= 0
  @losses ||= 0
  @ties ||= 0
  session[:ties] ||= 0
  session[:wins] ||= 0
  session[:losses] ||= 0
end

get '/' do
    erb :move
end

post '/throw/' do
  player_throw = params["throw"].to_sym

  if !@throws.include?(player_throw)
    halt 403, "You must throw one of the following: #{@throws}"
  end

  computer_throw = @throws.sample

  if player_throw == computer_throw then
    session[:ties] = session[:ties] + 1
    @ties = @ties + 1
    @result = "You tied with the computer. Try again!"
    erb :index
  elsif computer_throw == @defeat[player_throw]
    session[:wins] = session[:wins] + 1
    @wins = @wins + 1
    @result = "Nicely done; #{player_throw} beats #{computer_throw}!"
    erb :index
  else
    session[:losses] = session[:losses] + 1
    @losses = @losses + 1
    @result = "Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!"
    erb :index
  end
end
