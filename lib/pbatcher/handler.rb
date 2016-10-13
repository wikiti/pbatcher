module PBatcher
  class Handler
    attr_reader :generator

    def initialize(generator)
      @generator = generator
    end
  end
end
