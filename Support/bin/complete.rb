#!/usr/bin/env ruby -wKU

require ENV['TM_SUPPORT_PATH'] + '/lib/osx/plist'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'
require ENV['TM_BUNDLE_SUPPORT'] + '/bin/parser.rb'

begin
  choices = []
  
  env_current_word  = ENV["TM_CURRENT_WORD"]
  env_file_path     = ENV["TM_FILEPATH"]
  env_project_path  = ENV["TM_PROJECT_DIRECTORY"]
  
  #puts "env_current_word:" + env_current_word
  
  #import
  if(env_current_word == "import \"\"" || env_current_word == "include \"\"")
    env_current_word = ""
    headers = Parser.find_headers(env_project_path, "")
    headers.each {|r|
      item = r
      display = item
      insert  = ""
      choices += OSX::PropertyList.load(Parser.parse_choice(display, insert))
    }
    
    #puts "import or include"
  end
  
  
  
  #puts choices
  
  options = {:extra_chars => ' _', :case_insensitive => false, :initial_filter => env_current_word}
  TextMate::UI.complete(choices, options)
end