require 'capistrano/bundler'
# config valid only for current version of Capistrano
lock '3.4.0'
# server "130.211.186.249", user: "lukelu", roles: %w{web, app, db}, primary: true

set :application, 'smokio-case'
set :user, "lukelu"
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{ fetch(:user) }/myapps/#{ fetch(:application) }"
set :use_sudo, true
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :scm is :git
set :scm, :git
set :repo_url, 'https://github.com/lusketeer/case-luke-io.git'
set :rbenv_custom_path, "/home/lukelu/.rbenv"
set :rbenv_ruby, '2.1.0'
set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(publickey)
}

# set :default_environment, {
#   # :PATH => '$HOME/.rvm/gems/ruby-2.0.0-p353/bin:$PATH',
#   # :GEM_HOME => '$HOME/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0'
#   # :GEM_PATH => '$HOME/.rvm/gems/ruby-2.0.0-p353:$HOME/.rvm/gems/ruby-2.0.0-p353@global'
# }
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

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  # task :restart, roles: :app do
  #   run "sudo service nginx restart"
  # end
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute :rake, 'cache:clear'
      end
    end
  end

end
