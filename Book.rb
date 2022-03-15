require_relative './Item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, id, publish_date, archived = false)
    super(id, publish_date, archived = false)
    @publisher = publisher
    @cover_state = cover_state
  end

  
  def can_be_archived?
    if can_be_archived? || @cover_state == 'bad'
      @achived = true 
    else false
    end
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
