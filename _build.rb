File.open('all.rb', 'w') do |f|
  f.write("#{File.read("helpers.rb")}\n")
  f.write("#{File.read("welcome.rb")}\n")
  f.write("#{File.read("gems.rb")}\n")

  f.write("after_bundle do\n")
    f.write("run 'bin/spring stop'\n\n")
    f.write("git :init\n")
    f.write("git add: '.'\n")
    f.write("#{File.read("rspec_install.rb")}\n")
    f.write("#{File.read("rspec.rb")}\n")
    f.write("rails_command('generate graphiti:install')\n")
    f.write("run 'bundle binstubs bundler --force'\n")
    f.write("say(set_color(\"\\nYou're all set!\n\", :green, :bold))")
  f.write("end\n") # after bundle
end
