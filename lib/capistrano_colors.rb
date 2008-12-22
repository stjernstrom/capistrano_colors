puts "\e[36m    == capistrano_colors loaded ==\e[0m"

module Capistrano
  class Logger

    def colorize(message, color, nl = "\n")
      "\e[#{color}m" + message.strip + "\e[0m#{nl}"
    end

    def debug(message, line_prefix=nil)
      if message =~ /executing `.*/
        # log(DEBUG, colorize("==[task]====================================", "32"), line_prefix)
        log(DEBUG, colorize("== Currently " + message, "32"), line_prefix)
        # log(DEBUG, colorize("============================================", "32"), line_prefix)
      else          
        log(DEBUG, colorize(message, "33"), line_prefix)            
      end
    end

    def info(message, line_prefix=nil)
      if message =~ /.*out\] (fatal:|ERROR:).*/
        color = "31"
      elsif message =~ /Permission denied/
        color = "31"
      else
        color = "0"
      end
      log(INFO, colorize(message,color), line_prefix)        
    end
    
    def important(message, line_prefix=nil)
      if line_prefix =~ /^err ::/
        color = "31"
      else
        color = 34
      end
      log(IMPORTANT, colorize(message, color), line_prefix) if !message.strip.empty?
    end
    
    def trace(message, line_prefix=nil)
      log(TRACE, message, line_prefix)
    end
  end
end