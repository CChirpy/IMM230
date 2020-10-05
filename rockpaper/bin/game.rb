require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

before do
  # content_type :txt
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get '/' do
    return 'Go to /throw/'
end

get '/throw/' do
    erb :make_move
end

post '/throw/' do
  player_throw = params[:player_throw].to_sym
  outcome = ""
  
  unless @throws.include?(player_throw)
    halt 403, outcome = "You must throw one of: #{@throws}"
  end
  
  computer_throw = @throws.sample

  if player_throw == computer_throw
    outcome = "You tied with the computer. Try again!"
  elsif computer_throw == @defeat[player_throw]
    outcome ="Nicely done; #{player_throw} beats #{computer_throw}!"
  else
    outcome = "Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!"
  end
  
  erb :index, :locals => {'player_throw' => player_throw, 'outcome' => outcome}
end
