require 'sqlite3'
require 'sinatra'

# Examples: http://zetcode.com/db/sqliteruby/connect/
# http://zetcode.com/db/sqliteruby/queries/

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

# post '/insert' do
#   input = params['input']
#   @db.execute "INSERT INTO items (id, input) VALUES('#{id}','#{input}')"
#   @items = @db.execute "SELECT * FROM items"
#   erb :index
# end
