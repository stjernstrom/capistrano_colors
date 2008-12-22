puts "\e[36m    == capistrano_colors loaded ==\e[0m"

module Capistrano
  class Logger

    CC_STD    = "0" 
    CC_RED    = "31"
    CC_GREEN  = "32"
    CC_YELLOW = "33"
    CC_BLUE   = "34"

    def colorize(message, color, nl = "\n")
      "\e[#{color}m" + message.strip + "\e[0m#{nl}"
    end

    def debug(message, line_prefix=nil)
      if message =~ /executing `.*/
        log(DEBUG, colorize("== Currently " + message, CC_GREEN), line_prefix)
      else          
        log(DEBUG, colorize(message, CC_YELLOW), line_prefix)            
      end
    end

    def info(message, line_prefix=nil)
      if message =~ /.*out\] (fatal:|ERROR:).*/ || message =~ /Permission denied/
        color = CC_RED
      else
        color = CC_STD
      end
      log(INFO, colorize(message,color), line_prefix)        
    end
    
    def important(message, line_prefix=nil)
      if line_prefix =~ /^err ::/
        color = CC_RED
      else
        color = CC_BLUE
      end
      log(IMPORTANT, colorize(message, color), line_prefix) if !message.strip.empty?
    end
    
    def trace(message, line_prefix=nil)
      log(TRACE, message, line_prefix)
    end
  end
end