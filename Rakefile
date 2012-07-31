#!/usr/bin/env macrake

require 'rake/testtask'

namespace :test do 
  desc 'Tests for Song'
  Rake::TestTask.new :song do |t|
    t.libs << "test"
    t.test_files = FileList['test/test_song.rb']
  end
  desc 'Tests for Player'
  Rake::TestTask.new :player do |t|
    t.libs << "test"
    t.test_files = FileList['test/test_player.rb']
  end
  desc 'Tests for Input Handler'
  Rake::TestTask.new :io_handler do |t|
    t.libs << "test"
    t.test_files = FileList['test/test_io_handler.rb']
  end
  desc 'Tests for Command'
  Rake::TestTask.new :command do |t|
    t.libs << "test"
    t.test_files = FileList['test/test_command.rb']
  end
  desc 'Tests for Finder'
  Rake::TestTask.new :finder do |t|
    t.libs << "test"
    t.test_files = FileList['test/test_finder.rb']
  end
  task :all => [:song, :player, :io_handler, :command]
end

task :default => 'test:all'
