# config valid only for current version of Capistrano
lock '3.4.0'

# server "130.211.186.249", :web, :app, :db, primary: true

set :application, 'smokio-case'
set :user, "lukelu"
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{ fetch(:user) }/myapps/#{ fetch(:application) }"
set :use_sudo, false
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :scm is :git
set :scm, :git
set :repo_url, 'git@github.com:lusketeer/case-luke-io.git'

# set :stages, ["staging", "production"]
# set :default_stage, "staging"

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  task :restart, roles: :app do
    run "sudo service nginx restart"
  end
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end