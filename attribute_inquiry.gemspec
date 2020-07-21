lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attribute_inquiry/version'

Gem::Specification.new do |spec|
  spec.name          = 'attribute_inquiry'
  spec.version       = AttributeInquiry::VERSION
  spec.authors       = ['Frederik Spang']
  spec.email         = ['frederik@progras.dk']

  spec.summary = \
    'Provides shortcut for transforming attributes into a StringInquirer'

  spec.homepage = 'https://oss.progras.dk/attribute_inquirer'
  spec.license  = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = \
    'https://oss.progras.dk/attribute_inquirer'
  spec.metadata['changelog_uri'] = \
    'https://oss.progras.dk/attribute_inquirer/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  #   into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
