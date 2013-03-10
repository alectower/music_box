require 'em/pure_ruby'

module MusicBox
  module Client

    def receive_data(data)
      EventMachine::stop_event_loop
    end

    def self.send_command(command)
      begin
        EventMachine::run do
          EventMachine::connect "127.0.0.1", 8081, self do |c|
            c.send_data command
          end
        end
      rescue Errno::EPIPE
        retry
      end
    end

  end
end

