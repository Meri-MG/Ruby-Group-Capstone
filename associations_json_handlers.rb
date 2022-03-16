module AssociationsJsonHandlers
  # rubocop:disable Style/GuardClause
  def open_sources
    if File.exist?('sources.json')
      JSON.parse(File.read('sources.json')).map do |source|
        source_object = create_source_object(source)
        @sources << source_object
      end
    end
  end

  def open_labels
    if File.exist?('labels.json')
      JSON.parse(File.read('labels.json')).map do |label|
        label_object = create_label_object(label)
        @labels << label_object
      end
    end
  end

  def open_genres
    if File.exist?('genres.json')
      JSON.parse(File.read('genres.json')).map do |genre|
        name = genre['name']
        new_genre = Genre.new(name)
        @genres << new_genre
      end
    else
      []
    end
  end

  def open_authors
    if File.exist?('authors.json')
      JSON.parse(File.read('authors.json')).map do |author|
        author_object = create_author_object(author)
        @authors << author_object
      end
    end
  end

  def create_author_object(author)
    new_object = Author.new(author['first_name'], author['last_name'])
    new_object.id = author['id'].to_i
    new_object
  end

  def create_source_object(source)
    new_object = Source.new(source['name'])
    new_object.id = source['id'].to_i
    new_object
  end

  def create_label_object(label)
    new_object = Label.new(label['title'], label['color'])
    new_object.id = label['id'].to_i
    new_object
  end

  def create_genre_object(genre)
    new_object = Genre.new(genre['name'])
    new_object.id = genre['id'].to_i
    new_object
  end
  # rubocop:enable Style/GuardClause
end
