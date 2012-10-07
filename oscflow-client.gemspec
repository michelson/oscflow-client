# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oscflow-client/version'

Gem::Specification.new do |gem|
  gem.name          = "oscflow-client"
  gem.version       = Oscflow::Client::VERSION
  gem.authors       = ["Miguel Michelson"]
  gem.email         = ["miguelmichelson@gmail.com"]
  gem.description   = %q{Midi client to send data to oscflow}
  gem.summary       = %q{Midi client to send data to oscflow using unimidi and oscruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  
  gem.add_runtime_dependency(%q<colored>,             ["~> 1.2"])
  gem.add_runtime_dependency(%q<rake>,                ["~> 0.9.2"])
  gem.add_runtime_dependency(%q<erubis>,              ["~> 2.7.0"])
  gem.add_runtime_dependency(%q<thor>,                ["~> 0.15.4"])
  gem.add_runtime_dependency(%q<unimidi>)
  gem.add_development_dependency(%q<bundler>,         ["~> 1.1"])
  gem.add_development_dependency(%q<rspec>,           ["~> 2.6.0"])
  
  
  gem.require_paths = ["lib"]
  
  
  
end
