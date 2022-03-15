require_relative '../Item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, id, publish_date, archived = false)
    super(id, publish_date, archived = false)
    @publisher = publisher
    @cover_state = cover_state
    @archived = archived
  end

  def can_be_archived?
    if can_be_archived? || @cover_state == 'bad'
      @achived = true
    else
      @archived = false
    end
  end
end
