puts "\n\e[36m    == capistrano_colors loaded ==\e[0m\n\n"

dir = File.dirname(__FILE__)

require dir + '/capistrano/configuration'
require dir + '/capistrano/logger'

# DEBUG
Capistrano::Logger.add_color_matcher({ :match => /executing `.*/,             :color => :green,   :level => 2, :prio => -10, :prepend => "== Currently " })
Capistrano::Logger.add_color_matcher({ :match => /.*/,                        :color => :yellow,  :level => 2, :prio => -20 })

# INFO
Capistrano::Logger.add_color_matcher({ :match => /.*out\] (fatal:|ERROR:).*/, :color => :red,     :level => 1, :prio => -10 })
Capistrano::Logger.add_color_matcher({ :match => /Permission denied/,         :color => :red,     :level => 1, :prio => -20 })
Capistrano::Logger.add_color_matcher({ :match => /sh: .+: command not found/, :color => :magenta, :level => 1, :prio => -30 })

# IMPORTANT
Capistrano::Logger.add_color_matcher({ :match => /^err ::/,                   :color => :red,     :level => 0, :prio => -10 })
Capistrano::Logger.add_color_matcher({ :match => /.*/,                        :color => :blue,    :level => 0, :prio => -20 })
