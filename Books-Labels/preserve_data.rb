require 'json'
require 'pry'
require_relative 'book'
require_relative 'label'

# rubocop: disable Metrics

module DataLayer
  def object_to_hash(obj)
    obj.instance_variables.each_with_object({}) do |var, hash|
      key = var.to_s.delete('@')
      value = obj.instance_variable_get(var)
      if %w[Book Label].include?(value.class.name)
        value = object_to_hash(value)
      end
      hash[key] = value
      case obj.class.name
      when 'Book'
        hash['type'] = 'Book'
      when 'Label'
        hash['type'] = 'Label'
      end
      hash
    end
  end

  def hash_to_object(hash, classname)
    case classname
    when 'Book'
      Book.new(hash['title'], hash['publisher'], hash['cover_state'], publish_date: hash['publish_date'], archived: hash['archived'])
    when 'Label'
      Label.new(title: hash['title'], color: hash['color'])
    end
  end

  def save_data(filename, data)
    File.open(filename, 'w') do |file|
      file.puts data.to_json
    end
  end

  def read_data(filename)
    data = []
    data = JSON.parse(File.read(filename)) if File.exist?(filename)
    data
  end
end

  # rubocop: enable Metrics
