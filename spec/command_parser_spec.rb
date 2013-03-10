require 'spec_helper'
require 'music_box/command_parser'

describe MusicBox::CommandParser do
  describe "#parse_command" do
    let(:parser) {MusicBox::CommandParser.new}
    
    context "shuffle" do
      
      it "accepts shuffle command without name" do
        parser.parse_command("shuffle").should == { 
          :album_artists_songs => [],
          :shuffle => true
        }
      end
      
      it "accepts shuffle command with single name" do
        parser.parse_command("shuffle Bob Marley").should == {
          :album_artists_songs => ["Bob Marley"],
          :shuffle => true
        }
      end

      it "accepts shuffle command with multiple names" do
        parser.parse_command("shuffle Bob Marley, Minus The Bear, Andy Mckee").should == {
          :album_artists_songs => ["Bob Marley", "Minus The Bear", "Andy Mckee"],
          :shuffle => true
        }
      end

    end

    context "in order" do
      
      it "accepts a single name" do
        parser.parse_command("Maritime").should == {
            :album_artists_songs => ["Maritime"],
            :shuffle => false
          }
      end
      
      it "accepts multiple names" do
        parser.parse_command("Maritime, Braid, Incubus").should == {
            :album_artists_songs => ["Maritime", "Braid", "Incubus"],
            :shuffle => false
          }
      end
      
    end
  end
end
