require 'helper'

class TestNamer < Test::Unit::TestCase
  context 'creating a namer with a block' do
    should 'return the representation of the item' do
      @namer = PBatcher::Namer.new(nil_pbatcher) { |x| "-#{x}-" }
      assert_equal @namer.name(3), "-3-"
    end
  end

  context 'creating a namer with a proc' do
    should 'return the representation of the item' do
      @namer = PBatcher::Namer.new nil_pbatcher, ->(x) { "-#{x}-" }
      assert_equal @namer.name(3), "-3-"
    end
  end
end
