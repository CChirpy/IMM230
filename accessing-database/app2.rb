require 'sqlite3'
require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

# Example: http://zetcode.com/db/sqliteruby/connect/

before {
  @db = SQLite3::Database.open "test.db"
  @db.execute "CREATE TABLE IF NOT EXISTS items(
    id INTEGER PRIMARY KEY autoincrement,
    input TEXT)"
  @initable = @db.prepare "SELECT * FROM items"
}

get '/' do
  @db.results_as_hash = true
  @items = @initable.execute
  erb :index
end

post '/insert' do
  @db.results_as_hash = true
  user_input = params['user_input']
  @db.execute "INSERT INTO items(input) VALUES('#{user_input}')"
  @itemsupdate = @db.execute "SELECT * FROM items"
  erb :form
end
