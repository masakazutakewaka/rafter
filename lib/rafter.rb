# frozen_string_literal: true

require "rafter/engine"

module Rafter
  module SchemaFileFinder
    class NotFoundError < StandardError; end

    SCHEMA_FILES = %w(Schemafile Schemafile.rb db/Schemafile db/Schemafile.rb)

    def schema_file
      not_found = Proc.new { NotFoundError.new("ridgepole\'s Schemafile was not found in #{SCHEMA_FILES.join(', ')}.")}
      SCHEMA_FILES.find(not_found) { |f| File.file? Rails.root.join(f) }
    end
  end

  module Schema
    class Error < StandardError; end

    extend SchemaFileFinder

    def self.build
      status = system "ridgepole -c config/database.yml -E #{Rails.env} -f #{schema_file} --apply"
      raise Error.new('ridgepole failed to apply Schemafile.') if status == false
    rescue => e
        puts e.full_message
        exit 1
    end
  end
end
