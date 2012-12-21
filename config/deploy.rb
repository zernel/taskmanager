require "bundler/capistrano"
require "rvm/capistrano"

server "184.71.54.14", :web, :app, :db, primary: true

set :application, "andertask"
set :user, "dev"
set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "dev@git.andertec.ca:/home/dev/repos/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml.psql"), "#{shared_path}/config/database.yml"
    put File.read("config/rvmrc"), "#{shared_path}/rvmrc"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/rvmrc #{release_path}/.rvmrc"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  task :trust_rvm, roles: :app do
    run "rvm rvmrc trust #{current_release}"
  end
  after "deploy:symlink_config", "deploy:trust_rvm"
end
