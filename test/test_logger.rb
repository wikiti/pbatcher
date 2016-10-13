require 'helper'

class TestValidator < Test::Unit::TestCase
  context 'creating a cli application' do
    should 'be a valid logger' do
      @pbatcher = nil_pbatcher
      %i(debug error fatal log warn).each do |method|
        assert @pbatcher.logger.respond_to?(method)
      end
    end
  end
end
