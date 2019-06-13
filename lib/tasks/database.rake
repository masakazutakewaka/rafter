# frozen_string_literal: true

%w(db:setup db:test:load).each { |t| Rake::Task[t].clear }

namespace :db do
  desc "override db:setup to use ridgepole"
  task setup: [:create, "schema:ridgepole:apply", :seed]

  namespace :schema do
    namespace :ridgepole do
      desc "apply ridgepole's schemafile"
      task :apply do
        Rafter::Schema.build
      end
    end
  end

  namespace :test do
    desc "apply ridgepole's schemafile"
    task :load do
      Rafter::Schema.build
    end
  end
end
