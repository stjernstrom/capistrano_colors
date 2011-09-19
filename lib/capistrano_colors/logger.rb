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

    CAP_ATTRIBUTES = {
              :bright     => 1,
              :dim        => 2,
              :underscore => 4,
              :blink      => 5,
              :reverse    => 7,
              :hidden     => 8
            }

    @@color_matchers = []

    alias_method :org_log, :log

    def log(level, message, line_prefix=nil) #:nodoc:

      color = :none
      attribute = nil

      # Sort matchers in reverse order so we can break if we found a match.
      @@sorted_color_matchers ||= @@color_matchers.sort_by { |i| -i[:prio] }

      @@sorted_color_matchers.each do |filter|

        if (filter[:level] == level || filter[:level].nil?)
          if message =~ filter[:match] || line_prefix =~ filter[:match]
            color = filter[:color]
            attribute = filter[:attribute]
            message = filter[:prepend] + message unless filter[:prepend].nil?
            message = Time.now.strftime('%T') + ' ' + message if filter[:timestamp]
            break
          end
        end

      end

      if color != :hide
        current_color = CAP_COLORS[color]
        current_attribute = CAP_ATTRIBUTES[attribute]

        line_prefix = colorize(line_prefix.to_s, current_color, current_attribute, nil) unless line_prefix.nil?
        org_log(level, colorize(message, current_color, current_attribute), line_prefix)
      end

    end

    def self.add_color_matcher( options ) #:nodoc:
      @@color_matchers.push( options )
    end

    def colorize(message, color, attribute, nl = "\n")
      attribute = "#{attribute};" if attribute
      "\e[#{attribute}#{color}m" + message.strip + "\e[0m#{nl}"
    end

  end

end
