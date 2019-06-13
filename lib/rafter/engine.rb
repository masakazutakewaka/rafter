# frozen_string_literal: true

module Rafter
  class Engine < Rails::Engine
    rake_tasks do
      load "rafter/tasks/database.rake"
    end
  end
end
