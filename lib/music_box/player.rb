module MusicBox
  class Player

    def play(song)
      @song = NSSound.alloc.initWithContentsOfFile(song, byReference: false)
      song.play
    end
    
    def stop
      @song.stop
    end
    
    def pause
      @song.pause
    end
    
    def resume
      @song.resume
    end
    
  end
end