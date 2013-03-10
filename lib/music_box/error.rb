module MusicBox
  class Error < StandardError
    
    attr_reader :original

    def initialize(msg, original=nil);
      super(msg);
      @original = original;
    end

  end
end
