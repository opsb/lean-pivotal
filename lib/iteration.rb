class Iteration
  
  def features
    stories_of_type('feature')
  end

  def finished_features
    finished features
  end

  def bugs
    stories_of_type('bug')
  end

  def finished_bugs
    finished bugs
  end

  def chores
    stories_of_type('chore')
  end

  def finished_chores
    finished chores
  end

  private
    def stories_of_type(type)
      stories.select{ |story| story.story_type == type }
    end
    def finished(stories)
      stories.select{ |story| ['finished','accepted'].include? story.current_state }
    end
end
