require 'music_box/finder' 
require 'music_box/song'

module MusicBox
  class Command
    include MusicBox::Finder
    
    def initialize(player)
      @player = player
    end
    
    def process_command(input)
      case input
      when /^s(huffle)?.*$/
        shuffle
        @player.play_song(@player.songs.shift)
      when /^n(ext)?.*$/
        @player.next_song
      when /^q(uit)?.*$/
        exit
      when /^h(elp)?.*$/
        display_main_options
      when /^p(lay)?\s.*/
        play_query input
      else
        print ">"
      end
    end
    
    def shuffle
      find(".*\.[(m4a)(mp3)]$").sort_by{rand}.each do |song| 
        @player.songs << MusicBox::Song.new(song)
      end
    end
    
    def play_query(input)
      puts "Playing #{input}"
    end
  end
end