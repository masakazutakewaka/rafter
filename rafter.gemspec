
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rafter/version"

Gem::Specification.new do |spec|
  spec.name          = "rafter"
  spec.version       = Rafter::VERSION
  spec.authors       = ["Masakazu Takewaka"]
  spec.email         = ["takewakamma@gmail.com"]

  spec.summary       = "Rails plugin for integration with ridgepole."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/masakazutakewaka/rafter"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'ridgepole'
  spec.add_dependency 'rspec-rails'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
