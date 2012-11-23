require_relative 'test_helper'

class TestCommand < MiniTest::Unit::TestCase
  
  def setup
    @player = MiniTest::Mock.new
    @command = MusicBox::Command.new @player
  end
  
  def test_process_command_shuffle
    class << @command
      def shuffle
        true
      end
    end
    assert @command.process_command "shuffle songs"
    assert @command.process_command "shuffle"
    assert @command.process_command "songs shuffle"
    assert @command.process_command "s"
  end
  
  def test_shuffle
    class << @command
      def find(player)
        ["fake_song.m4a", "another_fake_song.mp3"]
      end
      def reset_player
      end
    end
    @player.expect :songs, Array.new
    @player.expect :play_songs, true
    assert @command.shuffle
    assert @player.songs.size == 2
  end
end
