RAILS_ENV = ENV.fetch("RAILS_ENV", "6")

gem 'graphiti'
gem 'graphiti-rails'
gem 'vandal_ui'
gem 'kaminari', '~> 1.1'

if RAILS_ENV.to_i == 5
  gem 'responders', '~> 2.4'
else
  gem 'responders', '~> 3.0'
end

gem_group :development, :test do
  if RAILS_ENV.to_i == 5
    gem 'rspec-rails', '~> 3.5.2'
  else
    gem 'rspec-rails', '~> 4.0.0beta2'
  end
  
  gem 'factory_bot_rails', '~> 5.0'
  gem 'faker', '~> 2.5' # keep here for seeds.rb
  gem 'graphiti_spec_helpers'
end

gem_group :test do
  gem 'database_cleaner', '~> 1.7'
end
