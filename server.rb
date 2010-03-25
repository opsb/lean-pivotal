require 'rubygems'
require 'sinatra'
require 'pivotal-tracker'
require 'lib/iteration.rb'
require 'lib/story.rb'

raise 'Username and password are required arguments' unless ARGV.length == 2

$project = PivotalTracker.new ARGV[0],ARGV[1] 

def cycle_time
  details = $project.stories.inject({:count => 0, :total => 0}) do |acc,story| 
    if story.cycle_time
      acc[:count] += 1
      acc[:total] += story.cycle_time.to_f
    end
    acc
  end
  average = details[:total]/details[:count]
end

get '/' do
  @iteration = $project.current_iteration
  @cycle_time = cycle_time
  erb :index
end
