# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'uglst'
set :repo_url, 'git@github.com:ugtastic/uglst.git'
set :deploy_to, '/var/ugtastic/uglst'
set :pty, true
set :linked_files, %w{config/database.yml config/newrelic.yml config/secrets.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.1.2@uglst'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
