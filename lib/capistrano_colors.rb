require 'capistrano/configuration'
require 'capistrano/logger'

require 'capistrano_colors/configuration'
require 'capistrano_colors/logger'

# DEBUG
Capistrano::Logger.add_color_matcher({ :match => /executing `.*/,             :color => :green,   :level => 2, :prio => -10, :prepend => "== Currently ", :timestamp => true })
Capistrano::Logger.add_color_matcher({ :match => /.*/,                        :color => :yellow,  :level => 2, :prio => -20 })

# INFO
Capistrano::Logger.add_color_matcher({ :match => /.*out\] (fatal:|ERROR:).*/, :color => :red,     :level => 1, :prio => -10 })
Capistrano::Logger.add_color_matcher({ :match => /Permission denied/,         :color => :red,     :level => 1, :prio => -20 })
Capistrano::Logger.add_color_matcher({ :match => /sh: .+: command not found/, :color => :magenta, :level => 1, :prio => -30 })

# IMPORTANT
Capistrano::Logger.add_color_matcher({ :match => /^err ::/,                   :color => :red,     :level => 0, :prio => -10 })
Capistrano::Logger.add_color_matcher({ :match => /.*/,                        :color => :blue,    :level => 0, :prio => -20 })
