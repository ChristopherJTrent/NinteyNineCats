source "https://rubygems.org"

ruby "3.1.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end


gem "better_errors", "~> 2.10", :groups => [:development, :test]

gem "binding_of_caller", "~> 1.0", :groups => [:development, :test]

gem "pry-rails", "~> 0.3.9", :groups => [:development, :test]

gem "annotate", "~> 3.2", :groups => [:development, :test]

gem "faker", "~> 3.2", :groups => [:development, :test]
