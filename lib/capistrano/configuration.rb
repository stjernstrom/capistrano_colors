module Capistrano
  class Configuration

    def colorize(options)
      
      raise ":match needs to be defined and need to be a valid Regexp" if options[:match].class != Regexp
      raise ":color needs to be defined" if options[:color].nil?
      
      Capistrano::Logger.add_color_matcher(options[:match], options[:color], (options[:level] ? options[:level] : nil), (options[:prepend] ? options[:prepend] : nil), true)
    end
    
  end
end