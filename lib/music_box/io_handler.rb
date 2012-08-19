require 'music_box/display'

module MusicBox
  class IOHandler
    
    IO_HASH = {:in => STDIN, :out => STDOUT, :io => IO}
    
    def initialize(command, display)
      @command = command
      @display = display
    end
    
    def get_input(io = IO_HASH)
      data = select_input(io)
      @command.process_command(data) if data
    end
    
    def select_input(io)
      io[:in].read(100).chomp if io[:io].select([io[:in]], nil, nil, 5)
    end
    
  end
end