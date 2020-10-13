require 'sinatra'
require 'questions'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions

# trivia game should include at least 3 questions
# all questions should appear on the same page
# When a user answers the questions and submits the form,
# a percentage of how many answers the user has answered correctly should be displayed.
