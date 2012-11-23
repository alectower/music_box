require_relative 'test_helper'

class TestFinder < MiniTest::Unit::TestCase
  
  def setup
    @finder = Object.new
    @finder.extend MusicBox::Finder
  end
  
  def test_music_folder_exists
    assert @finder.find("fakesong.m4a", "~/fake/folder/path")
  end
  
end
