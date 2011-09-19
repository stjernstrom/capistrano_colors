module Capistrano
  class Configuration

    # Add custom colormatchers
    #
    # Passing a hash or a array of hashes with custom colormatchers.
    #
    # Add the following to your deploy.rb or in your ~/.caprc
    #
    # == Example:
    #
    #   require 'capistrano_colors'    
    #
    #   capistrano_color_matchers = [
    #     { :match => /command finished/,       :color => :hide,      :prio => 10, :prepend => "$$$" },
    #     { :match => /executing command/,      :color => :blue,      :prio => 10, :attribute => :underscore, :timestamp => true },
    #     { :match => /^transaction: commit$/,  :color => :magenta,   :prio => 10, :attribute => :blink },
    #     { :match => /git/,                    :color => :white,     :prio => 20, :attribute => :reverse },
    #   ]
    #
    #   colorize( capistrano_color_matchers )
    #
    # You can call colorize multiple time with either a hash or an array of hashes multiple times.
    #
    # == Colors:
    #
    # :color can have the following values:
    # 
    # * :hide  (hides the row completely)
    # * :none
    # * :black
    # * :red
    # * :green
    # * :yellow
    # * :blue
    # * :magenta
    # * :cyan
    # * :white
    #
    # == Attributes:
    # 
    # :attribute can have the following values:
    #
    # * :bright
    # * :dim
    # * :underscore
    # * :blink
    # * :reverse
    # * :hidden
    #
    # 
    #  == Text alterations
    #
    # :prepend gives static text to be prepended to the output
    # :timestamp adds the current time before the output
    #
    def colorize(options)
      
      if options.class == Array
        options.each do |opt|
          Capistrano::Logger.add_color_matcher( opt )
        end
      else
        Capistrano::Logger.add_color_matcher( options )
        
      end
    end
    
  end
end
