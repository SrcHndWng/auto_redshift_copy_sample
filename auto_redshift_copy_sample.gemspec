# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auto_redshift_copy_sample/version'

Gem::Specification.new do |spec|
  spec.name          = "auto_redshift_copy_sample"
  spec.version       = AutoRedshiftCopySample::VERSION
  spec.authors       = ["SrcHndWng"]
  spec.email         = [""]
  spec.summary       = %q{Bulk import to Redshift from s3}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
