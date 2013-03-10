require 'spec_helper'
require 'music_box/finder'

describe MusicBox::Finder do
  let(:finder) { MusicBox::Finder.new }
  describe "#construct_regex" do
    it "should match a name in any part of the file path" do
      /#{finder.construct_regex(["Weezer"])}/.should =~ "/Users/hippie/Music/iTunes/iTunes Media/Music/Weezer/Weezer/05 Undone (The Sweater Song).m4a"
    end

    it "should exclude a name not given" do
      /#{finder.construct_regex(["Bjork"])}/.should_not =~ "/Users/hippie/Music/iTunes/iTunes Media/Music/Weezer/Weezer/05 Undone (The Sweater Song).m4a"
    end
  end
end
