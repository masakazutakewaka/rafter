# frozen_string_literal: true

%w(db:setup db:test:load).each { |t| Rake::Task[t].clear }

namespace :db do
  desc "setup with ridgepole"
  task setup: [:create, "schema:ridgepole:apply", :seed]

  namespace :test do
    desc "load schema with ridgepole"
    task load: "schema:ridgepole:apply"
  end

  namespace :schema do
    namespace :ridgepole do
      desc "apply ridgepole's schemafile"
      task :apply do
        Rafter::Schema.apply
      end
    end
  end
end
