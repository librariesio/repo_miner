# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'repo_miner/version'

Gem::Specification.new do |spec|
  spec.name          = "repo_miner"
  spec.version       = RepoMiner::VERSION
  spec.authors       = ["Andrew Nesbitt"]
  spec.email         = ["andrewnez@gmail.com"]

  spec.summary       = "Mine repositories for interesting changes over time"
  spec.homepage      = "https://github.com/librariesio/repo_miner"
  spec.license       = "AGPL-3.0"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
