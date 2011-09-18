guard 'bundler' do
  watch('Gemfile')
end

#guard 'spork' do
#  watch('config/application.rb')
#  watch('config/environment.rb')
#  watch(%r{^config/environments/.*\.rb$})
#  watch(%r{^config/initializers/.*\.rb$})
#  watch('spec/spec_helper.rb')
#end

guard 'rspec', :version => 2, :bundler => true, :cli => "--require rspec/instafail --format RSpec::Instafail --colour" do
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^app/(.*)\.rb$})                          { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.*)\.rb$})                          { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('app/controllers/application_controller.rb') { "spec" }
  watch('spec/spec_helper.rb')                       { "spec" }
end

