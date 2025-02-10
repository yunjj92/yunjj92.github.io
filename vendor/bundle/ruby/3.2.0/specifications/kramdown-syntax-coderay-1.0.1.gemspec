# -*- encoding: utf-8 -*-
# stub: kramdown-syntax-coderay 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "kramdown-syntax-coderay".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Leitner".freeze]
  s.date = "2019-01-31"
  s.email = "t_leitner@gmx.at".freeze
  s.homepage = "https://github.com/kramdown/syntax-coderay".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "kramdown-syntax-coderay uses coderay to highlight code blocks/spans".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<kramdown>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<coderay>.freeze, ["~> 1.1"])
end
