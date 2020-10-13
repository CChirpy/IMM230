{"changed":false,"filter":false,"title":"5fetch_db_execute.rb","tooltip":"/5fetch_db_execute.rb","value":"#!/usr/bin/ruby\n\nrequire 'sqlite3'\n\nbegin\n    \n    db = SQLite3::Database.open \"test.db\"\n        \n    #convenience \"execute\" method on db object\n    rows = db.execute \"SELECT * FROM Cars LIMIT 5\"\n        \n    for row in rows do\n        puts row.join \"\\s\"\n    end\n            \nrescue SQLite3::Exception => e \n    \n    puts \"Exception occurred\"\n    puts e\n    \nensure\n    db.close if db\nend","undoManager":{"mark":-1,"position":-1,"stack":[]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":11,"column":22},"end":{"row":11,"column":22},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1539008183374}