Gem::Specification.new do |s|
  s.name        = "minsc"
  s.version     = "0.0.0"
  s.date        = "2016-04-23"
  s.summary     =
    "You have curried the favor of Boo, the only miniature giant space hamster in the Realm!"
  s.description = "A gem for implementing the Rules Engine pattern"
  s.authors     = ["Patrick Arthur Brown"]
  s.email       = "pab@hivemind.us.org"
  s.files       = ["lib/minsc.rb",
                   "lib/minsc/rules_engine.rb",
                   "lib/minsc/rule.rb"]
  s.homepage    = "https://github.com/ptrckbrwn/minsc"
  s.license     = "MIT"

  s.add_development_dependency "minitest", "~> 5.8", ">= 5.8.4"
end
