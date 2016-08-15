Gem::Specification.new do |gem|
  gem.name          = "cinch-integrate"
  gem.version       = "0.0.1"
  gem.authors       = ["Jonas Osborn"]
  gem.description   = "Cinch plugin that adds a notify event to cinch so that"\
    " other plugins can interface with the integrations in this plugin."
  gem.summary       = "Integrates services into cinch through a new event."
  gem.homepage      = "https://github.com/Xzanth/cinch-integrate"
  gem.license       = "GPL"
  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.require_paths = ["lib"]

  gem.add_dependency("cinch", "~> 2.3.2")
  gem.add_dependency("slack-ruby-clinet", "~> 0.7.6")
end