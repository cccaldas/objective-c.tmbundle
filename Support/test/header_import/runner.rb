#!/usr/bin/env ruby
require "../../bin/parser.rb"

begin
  
  def run_find_headers
    puts "run_find_headers"
    puts ""
    
    puts "search for: App"
    headers = Parser.find_headers("./files/", "App")
    puts headers
    puts ""
  end
  
  def run_context_classes
    puts "run_context_classes"
    puts ""
    
    puts "context classes for: ./files/SimpleCommand.m"
    classes = Parser.get_context_classes("./files/SimpleCommand.m")
    puts classes
    puts ""
    
    puts "context classes for: ./files/SimpleCommand.h"
    classes = Parser.get_context_classes("./files/SimpleCommand.h")
    puts classes
    puts ""
  end
  
  def run_public_methods
    puts "run_public_methods"
    puts ""
    
    puts "run_public_methods for: ./files/SimpleCommand.m"
    methods = Parser.get_public_methods("./files/SimpleCommand.m")
    puts methods
    puts ""
  end
  
  #run
  #run_find_headers
  #run_context_classes
  run_public_methods
end
