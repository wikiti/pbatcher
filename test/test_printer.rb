require 'helper'

class TestPrinter < Test::Unit::TestCase
  context 'priting success' do
    should 'print to stdout' do
      stdout = capture_stdout { PBatcher::Printer.success }
      assert_equal stdout, "[#{PBatcher::Printer::SUCCESS_MESSAGE}]"
    end
  end

  context 'priting failure' do
    should 'print to stdout' do
      stdout = capture_stdout { PBatcher::Printer.failure }
      assert_equal stdout, "[#{PBatcher::Printer::FAILURE_MESSAGE}]"
    end
  end

  context 'priting message without overflow' do
    should 'print to stdout' do
      stdout = capture_stdout { PBatcher::Printer.message 'Message' }
      assert_match /^Message\s+$/, stdout
    end
  end

  context 'priting message with overflow' do
    should 'print to stdout' do
      max_size = 100
      str = 'a' * max_size
      stdout = capture_stdout { PBatcher::Printer.message str, max_size: max_size }
      assert_not_equal stdout, str
      assert_match /\.\.\.$/, stdout
    end
  end

  context 'priting newline' do
    should 'print to stdout' do
      stdout = capture_stdout { PBatcher::Printer.newline }
      assert_match /^\r?\n$/, stdout
    end
  end
end
