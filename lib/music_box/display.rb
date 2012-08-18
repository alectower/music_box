require 'music_box/version'

module MusicBox
  class Display
    
    def initialize(player)
      player.add_observer(self)
    end
  
    GREEN = "\033[32m"
    WHITE = "\033[0m"
    BLUE = "\033[36m"
    YELLOW = "\033[33m"
    RED = "\033[31m"
    
    def display_program_info
      puts "\nMusicBox v#{MusicBox::VERSION}"
    end
    
    def display_main_options
      main_options = "\n\t#{YELLOW}Main Options:#{WHITE}"
      main_options << "\n\n\tshuffle                          : shuffle and play songs"
      main_options << "\n\tplay <artist> <album> <song>     : query for artist or song"
      main_options << "\n\thelp                             : display options"
      main_options << "\n\tquit                             : exit MusicBox"
      main_options << "\n\n\t#{YELLOW}Playing Options:#{WHITE}"
      main_options << "\n\n\tnext                             : play next song in queue"
      main_options << "\n\tpause                            : pause song"
      main_options << "\n\tresume                           : resume song"

      puts main_options
    end
  
    def display_song_info(song)
      playing_message = "\n#{GREEN}Playing...#{WHITE}"
      playing_message << "\n\n\tArtist\t :: #{song.artist}"
      playing_message << "\n\tAlbum\t :: #{song.album}"
      playing_message << "\n\tSong\t :: #{song.title}"
      puts playing_message
    end
    
    def display_input_ready
      print ">"
    end
    
    def update(song)
      display_song_info(song)
    end
    
  end
end