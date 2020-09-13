require_relative 'lib/word_lookup/version'

Gem::Specification.new do |spec|
  spec.name          = "word_lookup"
  spec.version       = WordLookup::VERSION
  spec.authors       = ["<caitlinhinshaw>"]
  spec.email         = ["<caitlin.hinshaw@gmail.com>"]

  spec.summary       = %q{A CLI application geared towards writers that uses the Words API to provide definitions, synonyms, antonyms, rhymes, and similar words for a given word.}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/caitlinhinshaw/word-lookup"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/caitlinhinshaw/word-lookup"
  spec.metadata["changelog_uri"] = "https://github.com/caitlinhinshaw/word-lookup"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_dependency "uri"
  spec.add_dependency "openssl"
end
