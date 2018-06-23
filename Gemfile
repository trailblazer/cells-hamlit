source "https://rubygems.org"

# Specify your gem's dependencies in cells-haml.gemspec
gemspec

gem "actionpack"
gem "actionview"
gem "railties"

gem "minitest-line"

case ENV["GEMS_SOURCE"]
  when "local"
    gem "cells", path: "../cells"
  when "github"
    gem "cells", github: "trailblazer/cells"
end
