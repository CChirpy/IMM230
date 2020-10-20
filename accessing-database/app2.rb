require 'sqlite3'

# Example: http://zetcode.com/db/sqliteruby/connect/
# Using SQLite: sqlite3 test.db | .mode column | .headers on
# sqlite> SELECT * FROM items;

begin
  # Connects to the test.db database.
  db = SQLite3::Database.open "test.db"

  # A new 'items' table is created if it does not already exist.
  db.execute "CREATE TABLE IF NOT EXISTS items(
    id INTEGER PRIMARY KEY autoincrement,
    input TEXT)"

  # The execute method executes the given SQL statement.
  for i in 1..10 do
    db.execute "INSERT INTO items(input) VALUES(#{i})"
  end

  # Checks for errors.
  rescue SQLite3::Exception => e
    puts "Exception occurred"
    puts e

  # Release the resources.
  ensure
    db.close if db
end
