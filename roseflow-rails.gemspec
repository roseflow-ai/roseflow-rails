require_relative "lib/roseflow/rails/version"

Gem::Specification.new do |spec|
  spec.name        = "roseflow-rails"
  spec.version     = Roseflow::Rails::VERSION
  spec.authors     = ["Lauri Jutila"]
  spec.email       = ["git@laurijutila.com"]
  spec.homepage    = "https://github.com/roseflow-ai/roseflow-rails"
  spec.summary     = "Ruby on Rails integration for Roseflow"
  spec.description = "Integrates Roseflow with Ruby on Rails"
  spec.license     = "MIT"
  
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/roseflow-ai/roseflow-rails.git"
  spec.metadata["changelog_uri"] = "https://github.com/roseflow-ai/roseflow-rails/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4.3"
  spec.add_dependency "roseflow"

  spec.add_development_dependency "rspec-rails"
end
