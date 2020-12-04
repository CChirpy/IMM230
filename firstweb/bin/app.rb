# https://learnrubythehardway.org/book/ex50.html

require 'sinatra'

# port has to be 8080 for cloud9
set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
    return 'Hello world'
end

get '/hello/' do
    erb :hello_form
end

post '/hello/' do
    greeting = params[:greeting] || "Hi There"
    name = params[:name] || "Nobody"
    
    # 09-24-2020 - modify user input
    greeting = greeting.reverse
    name = name.reverse
    
    erb :index, :locals => {'greeting' => greeting, 'name' => name}
end
