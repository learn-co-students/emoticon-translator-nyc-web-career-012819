# require modules here
require "pry"
require "yaml"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  new_hash = {}
  new_hash["get_emoticon"] = {}
  new_hash["get_meaning"] = {}
  emoticons.each do |meaning, emoti|
    new_hash["get_meaning"][emoti[1]] = meaning
    new_hash["get_emoticon"][emoti[0]] = emoti[1]
  end
  # binding.pry
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emo_lists = load_library(file_path)
  if emo_lists["get_emoticon"][emoticon]
    emo_lists["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emo_lists = load_library(file_path)
  if emo_lists["get_meaning"][emoticon]
    emo_lists["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
