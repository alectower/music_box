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
      when /^s$/
        shuffle
        @player.play_song(@player.songs.shift)
      when /^h$/
        display_main_options
      when /^q$/
        exit
      when /^n$/
        @player.next_song
      when /^p$/
        @player.pause_song
      when /^r$/
        @player.resume_song
      when /^p.*$/
        play_query input
        @player.play_song(@player.songs.shift)
      else
        print ">"
      end
    end
    
    def shuffle
      reset_player
      find_songs ".*\.[(m4a)(mp3)]$"
      @player.songs.shuffle! 
    end
    
    def play_query(input)
      input[0..1] = ''
      reset_player
      find_songs ".*#{input}.*\.[(m4a)(mp3)]$"
    end
    
    def find_songs(query)
      find(query).each do |song|
        @player.songs << MusicBox::Song.new(song)
      end
    end
    
    def reset_player
      @player.stop_song if @player.playing?
      @player.songs.clear if !@player.songs.empty?
    end
  end
end
