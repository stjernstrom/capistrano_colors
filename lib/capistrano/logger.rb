module Capistrano
  class Logger

    CAP_COLORS = { 
               :none     => "0",
               :black    => "30",
               :red      => "31",
               :green    => "32",
               :yellow   => "33",
               :blue     => "34",
               :magenta  => "35",
               :cyan     => "36",
               :white    => "37"
            } 

    @@color_matchers = []
    
    alias_method :org_log, :log

    def log(level, message, line_prefix=nil)
      
      color = :none
      
      @@color_matchers.each do |filter|
      
        if (filter[:level] == level || filter[:level].nil?)
          if message =~ filter[:regexp]
            color = filter[:color]
            message = filter[:prepend] + message if !filter[:prepend].nil?
          end
        end
        
      end

      if color != :hide
        current_color = CAP_COLORS[color]
        line_prefix = colorize(line_prefix.to_s, current_color) if !line_prefix.nil?
        org_log(level, colorize(message, current_color), line_prefix=nil)
      end
            
    end

    def self.add_color_matcher(regexp, color, level = nil, prepend = nil, push = nil)
      hash = { :regexp => regexp, :level => level, :color => color, :prepend => prepend }
      # puts "DEBUG: New rule: #{hash.inspect}"
      if push
        @@color_matchers.push( hash )
      else
        @@color_matchers.unshift( hash )
      end
    end 
    
    def colorize(message, color, nl = "\n")
      "\e[#{color}m" + message.strip + "\e[0m#{nl}"
    end

  end

end