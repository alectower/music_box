require 'observer'

module MusicBox
  class Player
    include Observable
    
    def play_song(song)
      @song = NSSound.alloc.initWithContentsOfFile(song.path, byReference: false)
      changed
      notify_observers(song)
      @song.play if @song
    end
    
    def stop_song
      @song.stop if @song
    end
    
    def pause_song
      @song.pause if @song
    end
    
    def resume_song
      @song.resume if @song
    end
    
    def playing?
      @song.isPlaying if @song
    end
    
  end
end