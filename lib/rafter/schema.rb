# frozen_string_literal: true

require_relative './schemafile_finder'

module Rafter
  module Schema
    class Error < StandardError; end

    extend SchemafileFinder

    def self.apply
      status = system "ridgepole -c config/database.yml -E #{Rails.env} -f #{schema_file} --apply"
      raise Error.new('ridgepole failed to apply Schemafile.') if status == false
    rescue => e
        puts e.full_message
        exit 1
    end
  end
end
