def copy_example(file)
  cp "#{ file }.example", file
end

file "config/database.yml" do |t|
  copy_example t.name
end

file "config/secrets.yml" do |t|
  copy_example t.name
end

desc "Initial application setup"
task :setup => %w(config/database.yml config/secrets.yml)
