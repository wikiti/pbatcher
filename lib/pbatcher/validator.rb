module PBatcher
  class Validator < ProcHandler
    attr_reader :method

    def valid?(result)
      !!method.call(result)
    end
  end
end
