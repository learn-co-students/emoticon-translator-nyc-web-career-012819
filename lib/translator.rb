require 'pry'
require 'yaml'

def load_library(file)
  emoticon=YAML.load_file(file)
  emo_translator={"get_meaning"=>{},"get_emoticon"=>{}}
  emoticon.each do |x,y|
    emo_translator["get_meaning"][emoticon[x][1]]=x
    emo_translator["get_emoticon"][emoticon[x][0]]=emoticon[x][1]
    end
    emo_translator
  end

def get_japanese_emoticon(file, emoticon)
  emo_translator=load_library(file)
  if emo_translator["get_emoticon"].include?(emoticon)
      emo_translator["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  emo_translator=load_library(file)
  if emo_translator["get_meaning"].include?(emoticon)
    emo_translator["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
