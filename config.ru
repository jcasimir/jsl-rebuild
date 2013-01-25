require 'bundler'
Bundler.require
require 'middleman/rack'

require "rack/rewrite"

use Rack::Rewrite do
  rewrite %r{/(.+)}, lambda {|match, rack_env|
    
    file_path = "source/#{match[1]}.html"
    erb_file = "#{file_path}.erb"
    
    puts "Looking for #{Dir.pwd} #{erb_file}"
    puts "File Exists #{File.exists? erb_file}"
    
    if File.exists? erb_file
      return "/#{match[1]}.html"
    else
      return "/#{match[1]}"
    end
  }
end

run Middleman.server
