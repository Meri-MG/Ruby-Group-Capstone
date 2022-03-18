require 'json'
require_relative 'game'
require_relative 'author'

module DataLayer
  def object_to_hash(obj)
    obj.instance_variables.each_with_object({}) do |var, hash|
      key = var.to_s.delete('@')
      value = obj.instance_variable_get(var)
      value = object_to_hash(value) if %w[Game Author].include?(value.class.name)
      hash[key] = value
      case obj.class.name
      when 'Game'
        hash['type'] = 'Game'
      when 'Author'
        hash['type'] = 'Author'
      end
      hash
    end
  end

  def hash_to_object(hash, classname)
    case classname
    when 'Game'
      Game.new(hash['publish_date'], hash['multiplayer'], hash['last_played_at'], hash['archived'])
    when 'Author'
      Author.new(hash['first_name'], hash['last_name'])
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
