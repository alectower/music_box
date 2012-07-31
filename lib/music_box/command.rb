module MusicBox
  class Command
    include MusicBox::Finder
    include MusicBox::IOHandler
    include MusicBox::Display
    
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
      reset_player
      find(".*\.[(m4a)(mp3)]$").sort_by{rand}.each do |song| 
        @player.songs << MusicBox::Song.new(song)
      end
      @player.play_songs
    end
    
    def reset_player
      if @player.current_song && @player.current_song.playing?
        @player.current_song.stop
        @player.songs.clear
      end
    end
    
    def next_song
      if @player.current_song
        @player.current_song.stop
        @player.play_songs
      end
    end
    
    def play_query(input)
      puts "Playing #{input}"
    end
  end
end