# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbvppc/version'

Gem::Specification.new do |spec|
  spec.name          = "rbvppc"
  spec.version       = Rbvppc::VERSION
  spec.authors       = ["John F. Hutchinson, Chris Wood"]
  spec.email         = ["jfhutchi@us.ibm.com, woodc@us.ibm.com"]
  spec.summary       = %q{Remote access for IBM P-Series HMC's}
  spec.description   = %q{This gem provides remote access to IBM P-Series Hardware Management Consoles}
  spec.homepage      = ""
  spec.license       = "IBM"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('net-ssh', ">= 2.8.0")

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
