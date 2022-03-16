module DisplayAssociations
  def display_labels
    if @labels.length.zero?
      puts 'Sorry! There is no labels registered!'.upcase
    else
      puts 'List of all Labels: \n'
      index = 0
      @labels.each do |label|
        puts "#{index}: Label: title: #{label.title} title: #{label.title}"
        index += 1
      end
    end
  end

  def display_sources
    if @sources.length.zero?
      puts 'Sorry! There is no sources registered!'.upcase
    else
      puts 'List of all Sources: \n'
      index = 0
      @sources.each do |source|
        puts "#{index}: Source: name: #{source.name}"
        index += 1
      end
    end
  end

  def display_authors
    if @authors.length.zero?
      puts 'Sorry! There is no games registered!'.upcase
    else
      puts 'List of all Authors: \n'
      index = 0
      @authors.each do |author|
        puts "#{index}: Author: first_name: #{author.first_name} last_name: #{author.last_name}"
        index += 1
      end
    end
  end

  def display_genres
    puts
    if @genres.length.zero?
      puts 'Sorry! There is no genre registered!'.upcase
    else
      puts "List of all genres: \n"
      @genres.each_with_index do |genre, index|
        puts "#{index} - Genre: #{genre.name}"
      end
    end
  end
end
