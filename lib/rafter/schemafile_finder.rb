# frozen_string_literal: true

module Rafter
  module SchemafileFinder
    class NotFoundError < StandardError; end

    SCHEMA_FILES = %w(Schemafile Schemafile.rb db/Schemafile db/Schemafile.rb)

    def schema_file
      not_found = Proc.new { NotFoundError.new("ridgepole\'s Schemafile was not found in #{SCHEMA_FILES.join(', ')}.")}
      SCHEMA_FILES.find(not_found) { |f| File.file? Rails.root.join(f) }
    end
  end
end
