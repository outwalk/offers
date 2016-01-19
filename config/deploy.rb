lock '3.4.0'

set :application, 'offers'
set :repo_url, 'git@github.com:outwalk/offers.git'
set :branch, ENV['BRANCH'] || 'master'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
