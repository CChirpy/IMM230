require 'rubygems'
require 'sinatra'
require 'discordrb/webhooks'
require 'sqlite3'
require_relative 'config.rb'
require_relative 'msgs.rb'

set :port, 8080
set :static, true
set :public_folder, 'public'
set :views, 'views'

# Using SQLite: sqlite3 test.db | .mode column | .headers on
# sqlite> SELECT * FROM items;

begin
    # Connects to the test.db database
    db = SQLite3::Database.open "messages.db"

    # A new 'messages' table is created if it does not already exist
    db.execute "CREATE TABLE IF NOT EXISTS messages(
        id INTEGER PRIMARY KEY autoincrement,
        name VARCHAR, contact VARCHAR, subject VARCHAR, message TEXT)"
end

get '/' do
    # Changes title of page in the head
    tab = "Portfolio"
    
    # Highlights active navigation link
    active1 = "active"
    active2 = ""
    active3 = ""
    erb :index, :locals => {'tab' => tab, 'active1' => active1, 'active2' => active2, 'active3' => active3}
end

get '/contact' do
    tab = "Contact"
    active1 = ""
    active2 = "active"
    active3 = ""
    erb :contact, :locals => {'tab' => tab, 'active1' => active1, 'active2' => active2, 'active3' => active3}
end

get '/about' do
    tab = "About"
    active1 = ""
    active2 = ""
    active3 = "active"
    erb :about, :locals => {'tab' => tab, 'active1' => active1, 'active2' => active2, 'active3' => active3}
end

post '/contact' do
    # Getting data from contact form
    @name = params[:name]
    @contact = params[:contact]
    @subject = params[:subject]
    @message = params[:message]
    
    # Assign a value if name and/or contact are blank
    if @name == ""
        @name = "Anonymous"
    end
    if @contact == ""
        @contact = "n/a"
    end
    
    # Custom Discord messages, go to msgs.rb
    number = rand(1..MESSAGES.length-1)
    if @name.downcase.include?("ozy") || @name.downcase.include?("sherwi")
        number = 0
    end
    
    # Send me a message through a webhook on Discord
    client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
    client.execute do |builder|
        builder.content = MESSAGES[number]
        builder.add_embed do |embed|
            embed.title = "#{@subject}"
            embed.description = "#{@message}"
            embed.timestamp = Time.now
            embed.add_field(name: "Name", value: "#{@name}")
            embed.add_field(name: "Contact Information", value: "#{@contact}")
        end
    end
    
    # Executes SQL statement, inserting form info
    db.execute "INSERT INTO messages(name, contact, subject, message) VALUES('#{@name}', '#{@contact}', '#{@subject}', '#{@message}')"

    # Redirects to contact page after hitting submit
    redirect '/contact'
end

