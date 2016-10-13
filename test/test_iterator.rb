require 'helper'

class TestIterator < Test::Unit::TestCase
  context 'creating an iterator with an array' do
    should 'be iterable' do
      @iterator = PBatcher::Iterator.new nil, [1, 2, 3]
      assert @iterator.iterate.is_a?(Enumerator)
    end
  end

  context 'creating an iterator with an enumerable' do
    should 'be iterable' do
      @iterator = PBatcher::Iterator.new nil, (1..3)
      assert @iterator.iterate.is_a?(Enumerator)
    end
  end

  context 'creating an iterator with a block' do
    should 'be iterable' do
      @iterator = PBatcher::Iterator.new nil, -> { (1..3) }
      assert @iterator.iterate.is_a?(Enumerator)
    end
  end

  context 'creating an iterator with a block' do
    should 'not be iterable' do
      @iterator = PBatcher::Iterator.new nil, -> { nil }
      assert_raise do
        @iterator.iterate
      end
    end
  end
end
