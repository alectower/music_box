module MusicBox
  class Song
    
    attr_reader :path
    
    def initialize(song_path)
      @path = song_path
    end
    
    def title
      @path.split("/").last
    end
    
    def album
      @path.split("/")[-2]
    end
    
    def artist
      @path.split("/")[-3]
    end

  end
end