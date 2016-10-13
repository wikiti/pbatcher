require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'pbatcher'

class Test::Unit::TestCase
  def capture_stdout
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    yield
    fake.string
  ensure
    $stdout = original_stdout
  end

  def nil_pbatcher
    pbatcher
  end

  def pbatcher_example
    output = nil
    capture_stdout do
      output = pbatcher do
        # Define the iterator (data) to process
        iteration [1, 5, 10, 20]

        # Define the callback to process each item.
        processing { |x| x * 2 }

        # Validate the processed content
        # (double of x must be smaller than 30)
        validation { |x| x < 30 }

        # Name each item for output purposes
        naming { |x| "nº #{x}" }
      end
    end
    output
  end
end
