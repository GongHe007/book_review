# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "book_review"
set :repo_url, "git@github.com:GongHe007/book_review.git"
set :rvm_ruby_version, '2.3.1'
set :linked_files, %w{config/database.yml config/secrets.yml} # files we want symlinking to specific entries in shared.
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp', 'vendor/bundle', 'public/system')
set :puma_threads, [8, 32]
set :puma_workers, 1
set :log_level, :info

set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end
end