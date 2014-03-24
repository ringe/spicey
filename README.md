# spicey

Spicey is a Rails app using the Spiceworks database.

## Installation

This needs to take place on your Spiceworks host.

Download and install [Git for Windows](http://git-scm.com/download/win)
Download the [Ruby Installer for Windows](http://rubyinstaller.org/)
Also download the Development Kit for Ruby Installer.

1. Install Ruby, choose to add Ruby binaries to PATH
2. Unzip the Development Kit to any folder
3. Install Git, add only Git to PATH (don't override system tools)
4. Open Command Prompt
5. Navigate to the unzipped Development kit and run ```ruby dk.rb init```
6. Then run ```ruby dk.rb install```
7. Run ```gem install bundler```
7. Navigate to C:\Program Files (x86)\Spiceworks\db
8. Run ```git clone http://github.com/ringe/spicey```
9. Enter the spicey folder and run ```bundle install```

You have a backdoor to the Spiceworks web app database.

## Usage

Right click on the spicey folder, and run Git Bash.
Run ```bundle exec rails c``` to open the [Rails console](http://guides.rubyonrails.org/command_line.html).

To add work / time spent on a ticket, you can do:

```ruby
u = User.find_by_email("your.email@example.com")
u.worked("4h 15min", 3.days.ago, 165, "Moved that server to a new room.\n#close")
```

The arguments are: time (String), date (DateTime), ticket_id (Integer), comment (String)

You can omit the comment if you want, or add [Spiceworks commands](http://community.spiceworks.com/help/Tickets_Anywhere) after newline (\n).

## Contributions

The problem I wanted to solve was adding time spent on tickets on a day in the past.

So that's what I've added.

Please fork and send push requests for other features.
