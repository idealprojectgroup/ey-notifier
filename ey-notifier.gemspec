# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'engineyard/notifier/version'

Gem::Specification.new do |s|
  s.name = 'ey-notifier'
  s.version = EY::Notifier::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = "Turn-key deployment notifications for Engine Yard"
  s.description = "This gem allows you to quickly configure deployment notifications for the Engine Yard platform."
  s.authors = [ "Derek Hopper" ]
  s.email = 'hopper.derek@gmail.com'
  s.homepage = "http://github.com/idealprojectgroup/ey-notifier"
  s.license = 'MIT'

  s.required_ruby_version = '>= 1.9.3'

  s.files = `git ls-files -z`.split("\x0").reject { |f| f.start_with?('spec/') }
  s.require_paths = %w(lib)

  s.test_files = Dir.glob("spec/**/*")

  s.add_development_dependency('rspec', '~>2.0')
  s.add_development_dependency('rake')
end
