# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork' do
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch(%r{features/support/}) { :cucumber }
end

guard 'rspec', :version => 2, :cli => '--drb --format Fuubar --color', :all_on_start => false, :all_after_pass => false do
  watch(%r{^spec/.+_spec\.rb$})
end