gem 'graphiti'
gem 'graphiti-rails'
gem 'vandal_ui'
gem 'kaminari', '~> 1.0'
gem 'responders', '~> 2.4'

gem_group :development, :test do
  gem 'rspec-rails', '~> 3.5.2'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker', '~> 1.7' # keep here for seeds.rb
  gem 'graphiti_spec_helpers'
end

gem_group :test do
  gem 'database_cleaner', '~> 1.6'
end
