# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'coveralls/rake/task'

Asc476::Application.load_tasks
Coveralls::RakeTask.new
task :test_with_coveralls => [:spec, 'coveralls:push']

