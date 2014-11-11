namespace :tdl do
  desc "Parse and import the contents of tdl files into the database"
  task :import => :environment do
    $stdout.sync = true
    print "Importing "

    # Tdl.parse_and_save("/home/hoa/Dropbox/Documents/Tada/AbstractEmma.tdl")
    Tdl.parse_and_save("/home/hoa/Dropbox/Documents/Tada/All.tdl")
    Tdl.parse_and_save("/home/hoa/Dropbox/Documents/Tada/All.done.tdl")
  end
end

