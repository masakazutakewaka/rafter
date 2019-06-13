# frozen_string_literal: true

require "rafter/version"
require "rafter/engine"

module Rafter
  class Error < StandardError; end

  module Schema
    SCHEMA_FILE = %w(Schemafile Schemafile.rb db/Schemafile db/Schemafile.rb)
    class NotFoundError < StandardError; end

    def self.build
      status = system "ridgepole -c config/database.yml -E #{Rails.env} -f #{schema_file} --apply"
      raise ::Error.new('ridgepole failed to apply Schemafile.') if status == false
    rescue => e
        puts e.full_message
        exit 1
    end

    def self.schema_file
      not_found = Proc { NotFoundError.new('ridgepole\'s Schemafile was not found.')}
      SCHEMA_FILE.find(not_found) { |f| File.file? Rails.root.join(f) }
    end
  end
end
