$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails_admin_yamap_field/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_yamap_field"
  s.version     = RailsAdminYamapField::VERSION
  s.authors     = ["Artem Yegorov"]
  s.email       = ["yegorov0725@yandex.ru"]
  s.homepage    = "https://github.com/yegorov/rails_admin_yamap_field"
  s.summary     = "Summary of RailsAdminYamapField."
  s.description = "Description of RailsAdminYamapField."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"
end
