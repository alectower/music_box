module MusicBox
  module IOHandler
    
    IO_HASH = {:in => STDIN, :out => STDOUT, :io => IO}
    
    def get_input(io = IO_HASH, &block)
      print ">"
      loop do
        return if block.call(select_input io)
      end
    end
    
    def select_input(io)
      data = io[:io].select([io[:in]], nil, nil, 5)
      data ? io[:in].read(100).chomp : false
    end
    
    def print(out = STDOUT, line)
      out.print line
    end
    
  end
end