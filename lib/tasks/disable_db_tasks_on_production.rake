DISABLED_TASKS = [
  'db:drop',
  'db:migrate:reset',
  'db:schema:load',
  'db:seed'
  # ...
]

namespace :db do
  desc 'Disable a task in production environment'
  task :guard_for_production do
    if Rails.env.production?
      if ENV['DANGER_ZONE'] != '1'
        puts 'This task is disabled in production.'
        puts 'If you really want to run it, call it again with `DANGER_ZONE=1`'
        exit
        # else
        # require 'heroku'
        # puts 'Making a backup of the database, just in case...'
        # puts `heroku pgbackups:capture`
      end
    end
  end
end

DISABLED_TASKS.each do |task|
  Rake::Task[task].enhance(['db:guard_for_production'])
end
