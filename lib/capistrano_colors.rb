puts "\n\e[36m    == capistrano_colors loaded ==\e[0m\n\n"

dir = File.dirname(__FILE__)

require dir + '/capistrano/configuration'
require dir + '/capistrano/logger'

# DEBUG
Capistrano::Logger.add_color_matcher( /executing `.*/,             :green,   2, "== Currently ")
Capistrano::Logger.add_color_matcher( /.*/,                        :yellow,  2)

# INFO
Capistrano::Logger.add_color_matcher( /.*out\] (fatal:|ERROR:).*/, :red,     1)
Capistrano::Logger.add_color_matcher( /Permission denied/,         :red,     1)
Capistrano::Logger.add_color_matcher( /sh: .+: command not found/, :magenta, 1)

# IMPORTANT
Capistrano::Logger.add_color_matcher( /^err ::/,                   :red,     0)
Capistrano::Logger.add_color_matcher( /.*/,                        :blue,    0)
