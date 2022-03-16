class Author
  attr_accessor :first_name, :last_name
  attr_writer :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.add_author(self)
  end

  def show_items
    @items
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
