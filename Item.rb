class Item
attr_accessor 

  def initialize(id, genre, author, source, label, publish_date, archived: true)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end
end
