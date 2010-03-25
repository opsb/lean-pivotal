require 'bluecloth'
require 'lib/datetime-ext'

class Story
  def desc
    d = description.gsub("*Acceptance Criteria*", "Acceptance Criteria").
	            gsub("Acceptance Criteria", "#### Acceptance Criteria")
    BlueCloth.new(d).to_html
  end
  def examples
    notes.select{|note| note.text =~ /example:.*/i }.map{|note| autolink(note.text.gsub(/Example:/i, ""))}
  end
  def finished?
  end
  def cycle_time
    @accepted_at && @created_at && @accepted_at.to_time - @created_at.to_time
  end 

  private
    def autolink(text)
      text.gsub /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/, '<a href="\0">\0<a>'
    end
end
