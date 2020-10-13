{"changed":false,"filter":false,"title":"app_datamapper.rb","tooltip":"/app_datamapper.rb","value":" require 'sinatra'\n require 'sqlite3'\n require 'data_mapper'\n \n \n DataMapper::setup(:default, \"sqlite3://#{Dir.pwd}/recall.db\")\n \nclass Car\n  include DataMapper::Resource\n  property :id, Serial\n  property :name, Text, :required => true\n  property :price, Integer, :required => true\n  \nend\n \nDataMapper.finalize.auto_upgrade!\n       \n        \nget '/' do\n   @cars = Car.all :order => :id.desc\n   @title = 'All Cars'\n    erb :indexd\nend        \n\npost '/insert' do \n  model = params['model']\n  price = params['price'].to_i\n \n  @C = Car.new\n  @C.name = model\n  @C.price = price\n  @C.save\n  \n  @cars2 = Car.all :order => :id.desc \n  \n  erb :carsd \n  \nend ","undoManager":{"mark":-1,"position":-1,"stack":[]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":3,"column":1},"end":{"row":3,"column":1},"isBackwards":true},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1539269192157}