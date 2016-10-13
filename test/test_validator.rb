require 'helper'

class TestValidator < Test::Unit::TestCase
  context 'creating a validator with a block' do
    should 'validate properly' do
      @validator = PBatcher::Validator.new(nil_pbatcher) { |x| x.odd? }
      assert @validator.valid?(3)
      assert !@validator.valid?(2)
    end
  end

  context 'creating a validator with a proc' do
    should 'validate properly' do
      @validator = PBatcher::Validator.new nil_pbatcher, ->(x) { x.odd? }
      assert @validator.valid?(3)
      assert !@validator.valid?(2)
    end
  end
end
