require "yaml"
require 'pry'

def load_library(path)
emots = YAML.load_file(path)
new = {}
new['get_meaning'] = {}
new['get_emoticon'] = {}

emots.each do |x,y|
new['get_meaning'][y.last] = x
new['get_emoticon'][y.first] = y.last
end

new
end

def get_japanese_emoticon(path, e_emoticon)
  emots = load_library(path)
  ding = "Sorry, that emoticon was not found"
  emots["get_emoticon"].each do |x,y|
    if x == e_emoticon
      ding = y
    end
  end
  ding
end

def get_english_meaning(path,j_emoticon)
  emots = load_library(path)
  ding = "Sorry, that emoticon was not found"
  emots["get_meaning"].each do |x,y|
    if x == j_emoticon
      ding = y
    end
  end
  ding
end