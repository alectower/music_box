module MusicBox
  class Song
    
    attr_reader :path
    
    def initialize(song_path)
      @path = song_path
    end
    
    def title
      @path
    end

  end
end