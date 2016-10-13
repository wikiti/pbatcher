module PBatcher
  class Iterator < Handler
    attr_reader :data

    def initialize(generator, data)
      super(generator)
      @data = data
    end

    def iterate(&block)
      iterator.each(&block)
    end

    private

    def iterator
      case data
      when Enumerator
        data
      when Proc
        data.call()
      when ->(data) { data.respond_to? :each }
        data
      else
        raise NotImplementedError, "Data type cannot be handled because it doesn't respond to :each."
      end
    end
  end
end
