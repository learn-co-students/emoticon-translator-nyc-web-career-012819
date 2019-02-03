# require modules here
require 'yaml'
require 'pry'

def load_library(filepath)
  loaded_hash = YAML.load_file(filepath)
  return_hash = { "get_emoticon" => {}, "get_meaning" => {} }

  loaded_hash.each do |meaning, emoticons|
		return_hash["get_emoticon"] = return_hash["get_emoticon"].merge({
			emoticons.first => emoticons[1]
		})
		return_hash["get_meaning"] = return_hash["get_meaning"].merge({
			emoticons[1] => meaning
		})
	end

	return_hash
end

def get_japanese_emoticon(filepath, western_emoticon)
  result = load_library(filepath)["get_emoticon"][western_emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, japanese_emoticon)
  result = load_library(filepath)["get_meaning"][japanese_emoticon]
  result ? result : "Sorry, that emoticon was not found"
end