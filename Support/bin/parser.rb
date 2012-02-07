class Parser
  def self.find_headers(path, keyword)
    headers = []
    result = %x( find "#{path}" -name "#{keyword}*.h" ).split("\n")
    result.each { |r|
      item = r
      item = item.gsub(%r{.*\/}, "")
      headers.push(item)
    }
    
    return headers
  end
  
  def self.parse_choice(display, insert)
    return "({display = '" + display + "'; insert = '" + insert + "';},)"
  end
  
  def self.find_files
    
  end
  
  def self.read_file(file)
    fl        = File.open(file, "rb")
    contents  = fl.read
    return contents
  end
  
  def self.is_header_file(file)
    return file.index(".h") != nil
  end
  
  def self.is_implementation_file(file)
    return file.index(".m") != nil
  end
  
  def self.get_implementation_file
    
  end
  
  def self.get_public_methods(file)
    file = file.sub(".m", ".h") #convert to header file
    content = Parser.read_file(file)
    result = content.scan(/^-.*;$/)
    methods = []
    result.each {|r|
      item = r
      puts item.scan(/^-\(.?\)/)
      
      item = item.gsub(/^-\(.*\)/, "") #removing return types
      #item = item.gsub(%r{/-\(.*\)/}, "") #removing return types
      
      #/#(\d*)/
      methods.push(item)
    }
    
    return methods
  end
  
  #return imported, included and extended classes
  def self.get_context_classes(file)
    content = Parser.read_file(file)
    if(Parser.is_implementation_file(file))
        content += Parser.read_file(file.sub(".m", ".h"))
    end
    
    classes = []
    result = content.scan(/#import.*\".*\"/)
    result.each {|r|
      item = r
      item = item.gsub(%r{#import|\"|.h}, "")
      classes.push(item)
    }
    
    return classes
  end
end