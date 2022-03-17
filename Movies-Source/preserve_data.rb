require 'json'
require_relative 'movie'
require_relative 'source'

module DataLayer
  def object_to_hash(obj)
    obj.instance_variables.each_with_object({}) do |var, hash|
      key = var.to_s.delete('@')
      value = obj.instance_variable_get(var)
      value = object_to_hash(value) if %w[Movie Source].include?(value.class.name)
      hash[key] = value
      case obj.class.name
      when 'Movie'
        hash['type'] = 'Movie'
      when 'Source'
        hash['type'] = 'Source'
      end
      hash
    end
  end

  def hash_to_object(hash, classname)
    case classname
    when 'Movie'
      Movie.new(hash['title'], hash['silent'], hash['publish_date'], hash['archived'])
    when 'Source'
      Source.new(hash['name'])
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
