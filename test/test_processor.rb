require 'helper'

class TestProcessor < Test::Unit::TestCase
  context 'creating a processor with a block' do
    should 'return the processed value' do
      @processor = PBatcher::Processor.new(nil_pbatcher) { |x| x * 2 }
      value = nil
      capture_stdout { value = @processor.process(3) }
      assert_equal value, 3 * 2
    end
  end

  context 'creating a processor with a proc' do
    should 'return the processed value' do
      @processor = PBatcher::Processor.new nil_pbatcher, ->(x) { x * 2 }
      value = nil
      capture_stdout { value = @processor.process(3) }
      assert_equal value, 3 * 2
    end
  end
end
