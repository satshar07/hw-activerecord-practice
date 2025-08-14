# -*- encoding: utf-8 -*-
# stub: formatador 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "formatador".freeze
  s.version = "1.2.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["geemus (Wesley Beary)".freeze]
  s.date = "2025-08-08"
  s.description = "STDOUT text formatting".freeze
  s.email = "geemus@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "https://github.com/geemus/formatador".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.7.1".freeze
  s.summary = "Ruby STDOUT text formatting".freeze

  s.installed_by_version = "3.5.22".freeze

  s.specification_version = 2

  s.add_runtime_dependency(%q<reline>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<shindo>.freeze, [">= 0".freeze])
end
