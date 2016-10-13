require 'helper'

class TestGenerator < Test::Unit::TestCase
  context 'creating an empty generator' do
    should 'has all handlers' do
      @generator = PBatcher::Generator.build

      assert !@generator.logger.nil?
      assert !@generator.processor.nil?
      assert !@generator.namer.nil?
      assert !@generator.validator.nil?
      assert !@generator.iterator.nil?
    end
  end

  context 'creating a complete generator' do
    should 'be iterable' do
      @generator = pbatcher_example

      assert !@generator.logger.nil?
      assert !@generator.processor.nil?
      assert !@generator.namer.nil?
      assert !@generator.validator.nil?
      assert !@generator.iterator.nil?
    end
  end
end
