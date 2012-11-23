require_relative 'test_helper'

class TestSong < MiniTest::Unit::TestCase
  
  def setup
    @song = MusicBox::Song.new("fakesong.m4a")
    class << @song
      attr_accessor :path, :song
    end
    @song_object = MiniTest::Mock.new
  end
  
  def test_song_path_constructor
    assert_equal "fakesong.m4a", @song.path
  end
  
  def test_play_song
    @song_object.expect :play, true
    assert @song.play { |path| @song_object }
    @song_object.verify
  end
  
  def test_stop
    @song_object.expect :stop, true
    @song.song = @song_object
    assert @song.stop
    @song_object.verify
  end
  
  def test_pause
    @song_object.expect :pause, true
    @song.song = @song_object
    assert @song.pause
    @song_object.verify
  end
  
  def test_resume
    @song_object.expect :resume, true
    @song.song = @song_object
    assert @song.resume
    @song_object.verify
  end
  
  def test_is_playing
    @song_object.expect :isPlaying, true
    @song.song = @song_object
    assert @song.playing?
    @song_object.verify
  end

end
