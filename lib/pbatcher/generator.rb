module PBatcher
  class Generator
    attr_reader :iterator, :processor, :validator, :namer, :logger

    def self.build(&block)
      obj = new
      obj.instance_eval(&block) if block_given?
      obj.run
      obj
    end

    def initialize

    end

    def run
      setup_default_handlers
      logger.info '------------------------------------'
      iterator.iterate { |item| processor.process item }
    end

    def naming(l = nil, &block)
      @namer = Namer.new self, l || block
    end

    def validation(l = nil, &block)
      @validator = Validator.new self, l || block
    end

    def iteration(data)
      @iterator = Iterator.new self, data
    end

    def processing(l = nil, &block)
      @processor = Processor.new self, l || block
    end

    def logging(logger)
      @logger = logger
    end

    private

    def setup_default_handlers
      @iterator ||= Iterator.new self, []
      @validator ||= Validator.new self, ->(item) { true }
      @namer ||= Namer.new self, ->(item) { item.to_s }
      @processor ||= Processor.new self, ->(item) { item }
      @logger ||= ::Logger.new('pbatcher.log')
    end

    # ...
  end
end
