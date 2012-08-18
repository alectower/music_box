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
      when /^n(ext)?.*$/
        next_song
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
      @songs = []
      find(".*\.[(m4a)(mp3)]$").sort_by{rand}.each do |song| 
        @songs << MusicBox::Song.new(song)
      end
      @player.play_song(@songs.shift)
    end
    
    def next_song
      if @player.playing?
        @player.stop_song
        @player.play_song(@songs.shift)
      end
    end
    
    def play_query(input)
      puts "Playing #{input}"
    end
  end
end