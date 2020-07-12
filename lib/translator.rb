require "yaml"


def load_library(file_path)
  emoticons = {}
  list = YAML.load_file(file_path)
  emoticons["get_emoticon"] = {}
  emoticons["get_meaning"] = {}
  list.each do |key, array|
    emoticons["get_meaning"][array[1]] = key
    emoticons["get_emoticon"][array[0]] = array[1]
  end
  emoticons
end

def get_japanese_emoticon(file_path, emo)
  list = load_library(file_path)
  if list["get_emoticon"].include?(emo)
    list["get_emoticon"].each do |e_emo, j_emo|
      if e_emo == emo
        return j_emo
      end
    end
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emo)
  list = load_library(file_path)
  if list["get_meaning"].keys.include?(emo)
    list["get_meaning"].each do |j_emo, name|
      if j_emo == emo
        return name
      end
    end
  else
    "Sorry, that emoticon was not found"
  end
end