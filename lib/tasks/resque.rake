require "resque/tasks"
require 'resque/scheduler/tasks'

namespace :resque do
  task :setup do
    require 'resque'

    # you probably already have this somewhere
    Resque.redis = 'localhost:6379'
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'


    #Resque.schedule = YAML.load_file('your_resque_schedule.yml')

    #require 'jobs'
  end

  task :scheduler => :setup_schedule
end
