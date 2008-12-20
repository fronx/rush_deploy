# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rush_deploy}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fran\303\247ois Wurmus"]
  s.date = %q{2008-12-20}
  s.email = %q{fronx@wurmus.de}
  s.files = ["README", "Rakefile", "lib/core_extensions.rb", "lib/rush_deploy", "lib/rush_deploy/rush_deploy.rb", "lib/rush_deploy/version.rb", "lib/rush_deploy.rb", "lib/svn.rb", "test/rush_deploy_test.rb"]
  s.homepage = %q{http://fronx.wurmus.de}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rush>, [">= 0.4"])
    else
      s.add_dependency(%q<rush>, [">= 0.4"])
    end
  else
    s.add_dependency(%q<rush>, [">= 0.4"])
  end
end
