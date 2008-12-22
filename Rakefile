require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('capistrano_colors', '0.2.1') do |p|
  p.description    = "Simple gem to display colors in capistrano output."
  p.url            = "http://github.com/stjernstrom/capistrano_colors"
  p.author         = "Mathias Stjernstrom"
  p.email          = "mathias@globalinn.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = ["capistrano >=2.3.0"]
  p.project        = "capistranocolor"
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

