desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  Session.sweep
end