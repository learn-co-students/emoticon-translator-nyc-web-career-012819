require 'yaml'
require 'pry'

def load_library(file)
  hash = YAML.load_file(file)
  emoticon_hash = {}
  japanese_emoticons = []
  english_emoticons = []
  hash.each do |meaning, emoticons| #example "angel"(key) => ["O:)", "☜(⌒▽⌒)☞"](value)
    japanese_emoticons << [emoticons[1], meaning]
    english_emoticons << [emoticons[0], emoticons[1]]
  end
  emoticon_hash["get_meaning"] = japanese_emoticons.to_h
  emoticon_hash["get_emoticon"] = english_emoticons.to_h

  emoticon_hash
end


def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  translation = ""
  hash.each do |key, value| # "get_meaning"(key), {"☜(⌒▽⌒)☞"=>"angel", "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry, etc}  (value)
    if key == "get_emoticon"
      value.each do |english_emoticon, japanese_emoticon|
        if english_emoticon == emoticon
          translation = japanese_emoticon
          break
        else
          translation = "Sorry, that emoticon was not found"
        end
      end
    end
  end
  translation
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  translation = ""
  hash.each do |key, value|
    if key == "get_meaning"
      value.each do |japanese_emoticon, meaning|
        if japanese_emoticon == emoticon
          translation = meaning
          break
        else
          translation = "Sorry, that emoticon was not found"
        end
      end
    end
  end
  translation
end
