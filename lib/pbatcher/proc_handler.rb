module PBatcher
  class ProcHandler < Handler
    attr_reader :method

    def initialize(generator, method = nil, &block)
      super(generator)
      method = method ? method : block
      raise ArgumentError, 'Namer is not a proc' unless method.is_a? Proc
      @method = method || block
    end

    def call(*args)
      method.call(*args)
    end
  end
end
