# -*- encoding: utf-8 -*-
require File.expand_path('../lib/music_box/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "music_box"
  gem.version       = MusicBox::VERSION
  gem.authors       = ["Alec Tower"]
  gem.email         = ["alectower@gmail.com"]
  gem.description   = %q{MacRuby command line application to play music from iTunes location}
  gem.summary       = %q{MacRuby command line application to play music from iTunes location}
  gem.homepage      = "https://github.com/uniosx/music_box"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
