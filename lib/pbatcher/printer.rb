module PBatcher
  module Printer
    extend self

    SUCCESS_MESSAGE = "OK".green.freeze
    FAILURE_MESSAGE = "FAIL".red.freeze

    OVERFLOW = '...'

    def message(str, options = { max_size: 90 })
      print message_str(str, options)
    end

    def success
      print "[#{SUCCESS_MESSAGE}]"
    end

    def failure
      print "[#{FAILURE_MESSAGE}]"
    end

    def newline
      puts ''
    end

    private

    def message_str(str, options)
      return message_str_overflow(str, options) if message_str_overflow?(str, options)
      message_str_normal(str, options)
    end

    def message_str_overflow(str, options)
      str[0...(options[:max_size] - OVERFLOW.size)] + OVERFLOW
    end

    def message_str_normal(str, options)
      str.ljust options[:max_size]
    end

    def message_str_overflow?(str, options)
      str.size > options[:max_size] - OVERFLOW.size
    end
  end
end
