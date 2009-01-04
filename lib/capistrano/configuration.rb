module Capistrano
  class Configuration

    def colorize(regexp, color, level = nil, prepend = nil)
      Capistrano::Logger.add_color_matcher(regexp, color, level, prepend, true)
    end
    
  end
end