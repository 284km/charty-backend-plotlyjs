
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "charty/backend/plotlyjs/version"

Gem::Specification.new do |spec|
  spec.name          = "charty-backend-plotlyjs"
  spec.version       = Charty::Backend::Plotlyjs::VERSION
  spec.authors       = ["284km"]
  spec.email         = ["k.furuhashi10@gmail.com"]

  spec.summary       = %q{Charty plotlyjs adapter}
  spec.description   = %q{Charty plotlyjs adapter}
  spec.homepage      = "https://github.com/284km/charty-backend-plotlyjs"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/284km/charty-backend-plotlyjs"
  # spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit"
end
