# portfolio changelog
generalized thoughts and changes recorded on a day to day basis

## 2020-12-09 - added database and fun notif msgs
- switched back to ruby after doing css
- added database for storing messages (messages.db)
- require 'sqlite3'
- more comments on how things work
- webhook now sends a variety of notification messages (msg.rb)
- looked into logins, couldn't figure it out for now

### 2020-12-08 - CSS and filler content
- added test folder w/ html files
- added css image gallery and
- added css to contact form

### 2020-12-07 - added discord webhook
- updated contact form
- require 'discordrb/webhooks'
- added file: config.rb, contains webhook url
- removed folders from public folder

### 2020-12-04 - html to ruby
- restructured website folders
- created app.rb
- added erb files
- title changes based on active tab
- updated notes and readme

### 2020-11-26 - test content filter
- added filter.js
- added placeholder content (text only)
- renamed planning.md to notes.md
- renamed notes folder to misc
- switched to camelcase
- took out <main> tag
- added some basic css

### 2020-11-25 - added basic html
- header and nav
- filter buttons

### 2020-11-03 - finished adding information to resume
- first actual log here
- resume completed for the most part,
  - future changes probably small or just an update to info
- renamed misc folder to notes (felt like this name was more appropriate)

### 2020-10-23 - initial commit
- root folder
  - blog.html, contact.html, index.html, work.html
  - css folder, media folder, script folder
  - style.css
- misc folder
  - changelog.md, planning.md, resume.md
