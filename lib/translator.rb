# require modules here
require "yaml"
require "pry"

def load_library (file_path)
  emoticons = YAML.load(File.read("#{file_path}"))
  # binding.pry
end

def get_japanese_emoticon (path, eng)
  # code goes here
end


def get_english_meaning
  # code goes here
end
