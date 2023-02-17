# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "agnes-theme"
  spec.version       = "0.1.0"
  spec.authors       = ["yunjj92"]
  spec.email         = ["81787195+yunjj92@users.noreply.github.com"]

  spec.summary       = %q{This page is for remembering what i learned}
  spec.homepage      = "https://yunjj92.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end 
