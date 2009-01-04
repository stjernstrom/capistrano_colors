module Capistrano
  class Configuration

    def colorize(options)
      
      # raise ":match needs to be defined and need to be a valid Regexp" if options[:match].class != Regexp
      # raise ":color needs to be defined" if options[:color].nil?
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