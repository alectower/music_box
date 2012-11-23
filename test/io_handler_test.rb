require_relative 'test_helper'

class TestIOHandler < MiniTest::Unit::TestCase
  
  def setup
    @handler = Object.new
    @handler.extend MusicBox::IOHandler
  end
  
  def test_get_input_with_input
    class << @handler
      def select_input(io)
        "shuffle"
      end
      def print(out = STDOUT, line)
      end
    end
    input = MiniTest::Mock.new
    input.expect :gets, "shuffle"
    io_hash = {:in => input, :out => MiniTest::Mock.new, :io => MiniTest::Mock.new}
    @handler.get_input io_hash do |input| 
      assert input == "shuffle", "Input not as expected : #{input}"
    end
  end
  
  def test_get_input_with_return
    class << @handler
      def select_input(io)
      end
      def print(out = STDOUT, line)
      end
    end
    io_hash = {:in => MiniTest::Mock.new, :out => MiniTest::Mock.new, :io => MiniTest::Mock.new}
    @handler.get_input io_hash do |input| 
      assert !input
    end
  end
  
  def test_select_input
    io = MiniTest::Mock.new
    input = MiniTest::Mock.new
    input.expect :read, "input", [100] 
    io.expect :select, "input", [[input], nil, nil, 5]
    io_hash = {:in => input, :out => MiniTest::Mock.new, :io => io}
    @handler.select_input(io_hash)
    io.verify
    input.verify
  end
end
