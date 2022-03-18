class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  @@authors = []
  @@authors_filename = 'authors.json'
  @@id = 1

  def initialize(first_name, last_name)
    @id = @@id
    @@id += 1
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end

  def self.overwrite_authors(arr)
    @@authors = arr
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'id' => @id,
      'items' => @items
    }.to_json(*args)
  end
end
