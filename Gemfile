source "https://rubygems.org"

gem "jekyll", "~> 4.3.4"
gem "csv", "~> 3.3"
gem "base64", "~> 0.2.0"
gem "httparty", "~> 0.22.0"

gem 'jekyll-theme-chirpy', '~> 7.2', '>= 7.2.4'

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-admin"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data", "~> 1.2023" # Adding a loose pin
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
