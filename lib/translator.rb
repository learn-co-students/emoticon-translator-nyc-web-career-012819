# require modules here
require "yaml"
require "pry"

def load_library (file_path)
  emoticons = YAML.load(File.read("#{file_path}"))
  hash={}
  hash["get_meaning"] = {}
  hash["get_emoticon"] = {}
  emoticons.each do |text, emoji|
    hash["get_meaning"][emoji[1]] = text
    hash["get_emoticon"][emoji[0]] = emoji[1]
  end
  hash
end

def get_japanese_emoticon (path, eng_emoji)
  # code goes here
  hash = load_library(path)
  msg = ""
  if hash["get_emoticon"].keys.include?(eng_emoji)
    msg = hash["get_emoticon"][eng_emoji]
  else
    msg = "Sorry, that emoticon was not found"
  end
end


def get_english_meaning (path, jap_emoji)
  # code goes here
  hash = load_library(path)
  msg = ""
  if hash["get_meaning"].keys.include?(jap_emoji)
    msg = hash["get_meaning"][jap_emoji]
  else
    msg = "Sorry, that emoticon was not found"
  end
  msg
end
