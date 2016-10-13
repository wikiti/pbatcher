module PBatcher
  class Processor < ProcHandler
    def process(item)
      pre(item)
      result = call(item)
      raise "Item #{item} is not a valid item." unless generator.validator.valid?(result)
      success(item)
      result
    rescue => e
      failure(item, e)
    end

    private

    def pre(item)
      Printer.message "Processing #{generator.namer.name item}"
      generator.logger.info "Processing #{generator.namer.name item}"
    end

    def success(item)
      Printer.success
      Printer.newline
      generator.logger.info "Processed #{generator.namer.name item}"
    end

    def failure(item, exception)
      Printer.failure
      Printer.newline
      generator.logger.error "Error while processing #{generator.namer.name item}: #{exception}"
    end

  end
end
