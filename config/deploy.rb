require 'capistrano/ext/multistage'
require 'database_yml/capistrano'
require "bundler/capistrano" # bundleしてくれる
require 'capistrano-rbenv'

set :application, 'maysee'
set :rbenv_ruby_version, '2.0.0p451'
set :bundle_gemfile,  "Gemfile"
set :bundle_flags,    "--quiet"
set :bundle_without,  [:development, :test]
set :bundle_cmd,      "bundle" # e.g. "/opt/ruby/bin/bundle"
set :bundle_roles,    {except: {no_release: true}} # e.g. [:app, :batch]

set :stages, %w(production)

namespace :rbenv do
  task :setup_shellenv do
    set :default_environment, {
      'RBENV_ROOT' => "#{rbenv_path}",
      'PATH' => "#{rbenv_path}/shims:#{rbenv_path}/bin:$PATH",
    }
  end
  after 'multistage:ensure', 'rbenv:setup_shellenv'
end

set :application, "maysee"
set :repository,  "https://github.com/ryoheitakada/maysee.git"
set :scm, :git
set :user, "senseinote"
set :use_sudo, false
set :ssh_options, port: "22"
set :keep_releases, 3
set :deploy_via, :remote_cache

before "deploy:restart", "deploy:symlink_shared"
after "deploy:update", "deploy:link_tmp"
after "deploy:update", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, roles: :app, except: { no_release: true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :link_tmp do
    run <<-CMD
      rm -rf #{release_path}/tmp && ln -nfs #{shared_path}/tmp #{release_path}/tmp
    CMD
  end
  task :symlink_shared do
    run "ln -s #{shared_path}/config/initializers/* #{release_path}/config/initializers/"
  end
end
