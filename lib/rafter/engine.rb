# frozen_string_literal: true

require '../extensions/thor'
require '../extensions/active_record'

module Rafter
  class Engine < Rails::Engine #:nodoc:
    rake_tasks do
      Rake::Task["db:setup"].clear
      namespace :db do
        desc "override db:setup to use ridgepole"
        task setup: [:create, "schema:ridgepole:apply", :seed]
      end

      namespace :schema do
        namespace :ridgepole do
          desc "apply ridgepole's schemafile"
          task :apply do
            sh "ridgepole -c config/database.yml -E #{Rails.env} -f db/Schemafile.rb --apply"
          end
        end
      end
    end
  end
end
