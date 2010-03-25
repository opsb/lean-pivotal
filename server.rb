require 'rubygems'
require 'sinatra'
require 'pivotal-tracker'
require 'lib/iteration.rb'
require 'lib/story.rb'

$project = PivotalTracker.new 

def cycle_time
  total = $project.stories.inject(0){ |acc,story| acc + (story.cycle_time||0)  }
  average = total/$project.stories.length
end

get '/' do
  @iteration = $project.current_iteration
  @cycle_time = cycle_time
  erb :index
end
