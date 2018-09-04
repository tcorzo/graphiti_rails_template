insert_into_file "config/routes.rb", :after => "Rails.application.routes.draw do\n" do
  <<-STR
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    # your routes go here
  end
  STR
end
