insert_into_file "spec/rails_helper.rb", :after => "require 'rspec/rails'\n" do
  "require 'graphiti_spec_helpers/rspec'\n"
end

insert_into_file "spec/rails_helper.rb", :after => "RSpec.configure do |config|\n" do
  <<-STR

  # bootstrap database cleaner
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    begin
      DatabaseCleaner.cleaning do
        example.run
      end
    ensure
      DatabaseCleaner.clean
    end
  end

  STR
end

insert_into_file "spec/rails_helper.rb", :after => "RSpec.configure do |config|\n" do
  <<-STR

  config.before :each do
    handle_request_exceptions(false)
  end
  STR
end

insert_into_file "spec/rails_helper.rb", :after => "RSpec.configure do |config|\n" do
  "  config.include Graphiti::Rails::TestHelpers\n"
end

insert_into_file "spec/rails_helper.rb", :after => "RSpec.configure do |config|\n" do
  "  config.include GraphitiSpecHelpers::Sugar\n"
end

insert_into_file "spec/rails_helper.rb", :after => "RSpec.configure do |config|\n" do
  "  config.include GraphitiSpecHelpers::RSpec\n"
end

insert_into_file "spec/rails_helper.rb", :after => "RSpec.configure do |config|\n" do
  "  config.include FactoryBot::Syntax::Methods\n"
end

gsub_file "spec/rails_helper.rb", 'config.fixture_path = "#{::Rails.root}/spec/fixtures"' do |match|
  "# #{match}"
end

gsub_file "spec/rails_helper.rb", 'config.use_transactional_fixtures = true' do |match|
  "# #{match}"
end

run "mkdir spec/factories"
