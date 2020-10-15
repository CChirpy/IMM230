# Instructions: insert something into a SQLite database 1000 times
# Example: http://zetcode.com/db/sqliteruby/connect/
# Using SQLite: sqlite3 test.db | .mode column | .headers on
# sqlite> SELECT * FROM items;

require 'sqlite3'

begin
  # Connects to the test.db database.
  db = SQLite3::Database.open "test.db"
  # A new 'items' table is created if it does not already exist.
  db.execute "CREATE TABLE IF NOT EXISTS items(id INTEGER PRIMARY KEY)"
  # The execute method executes the given SQL statement.
  db.execute "INSERT INTO items VALUES(1)"
  db.execute "INSERT INTO items VALUES(2)"
  db.execute "INSERT INTO items VALUES(3)"
  db.execute "INSERT INTO items VALUES(4)"
  db.execute "INSERT INTO items VALUES(5)"
  db.execute "INSERT INTO items VALUES(6)"
  db.execute "INSERT INTO items VALUES(7)"
  db.execute "INSERT INTO items VALUES(8)"

# Checks for errors.
rescue SQLite3::Exception => e
    puts "Exception occurred"
    puts e

# Release the resources.
ensure
    db.close if db

end
