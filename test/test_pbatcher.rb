require 'helper'

class TestPBatcher < Test::Unit::TestCase
  context 'creating a simple CLI application' do
    should 'not raise errors' do
      assert_nothing_raised do
        pbatcher_example
      end
    end
  end
end
