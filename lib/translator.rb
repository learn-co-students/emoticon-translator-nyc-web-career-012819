# require modules here
require "yaml"

def load_library(file)
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {} 
  }
  emoticon = YAML.load_file(file)
  emoticon.each do |key, value|
    new_hash["get_meaning"][value[1]] = key
    new_hash["get_emoticon"][value[0]] = value[1]
  end
  new_hash
end

def get_japanese_emoticon(file, emoticon)
  called_hash = load_library(file)["get_emoticon"]
  if called_hash.has_key?(emoticon)
    return called_hash[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  called_method = load_library(file)["get_meaning"]
  if called_method.keys.include?(emoticon)
    return called_method[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end