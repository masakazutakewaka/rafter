# frozen_string_literal: true

module Rafter
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../tasks/database.rake', __dir__)
    end
  end
end
