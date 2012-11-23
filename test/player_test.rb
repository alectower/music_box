require_relative 'test_helper'

class TestPlayer < MiniTest::Unit::TestCase
  
  describe Player do
    before do
      @it = Object.new
      @it.extend(MusicBox::Player)
		end
    it "should play a song when notified" do
      @it.update(:play, )
    end
  end
  
end
