require "rubygems"
require 'launchy'

class Writer
  def write(f)
    f.puts "<html>"
    f.puts "<head>"
    f.puts "<link type='stylesheet' href='_main.css'">
    f.puts "<body>"
    f.puts "<header>"
    f.puts "<h1>Welcome"
  end
  def deleteAll(f)
    f.truncate(0)
  end
end

class Initiate
  if !File.directory?("html")
    Dir.mkdir "html"
  end
  Dir.chdir "html"
  if File.file?("index.html")
    File.open("index.html", "a") { |f|
      Writer.new.deleteAll(f)
      Writer.new.write(f)
    }
    Launchy.open(Dir.pwd + "/index.html")
    Dir.chdir "../"
  end
end
