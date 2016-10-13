require 'logger'

require 'colorize'

require 'pbatcher/printer'
require 'pbatcher/handler'
require 'pbatcher/proc_handler'
require 'pbatcher/processor'
require 'pbatcher/validator'
require 'pbatcher/namer'
require 'pbatcher/iterator'
require 'pbatcher/generator'

def pbatcher(&block)
  PBatcher::Generator.build(&block)
end
