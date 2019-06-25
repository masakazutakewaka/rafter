# frozen_string_literal: true

module Rafter
  module Schema
    class Error < StandardError; end

    def self.apply
      status = system "ridgepole -c config/database.yml -E #{Rails.env} -f #{schema_file} --apply"
      raise Error.new('ridgepole failed to apply Schemafile.') if status == false
    rescue => e
        puts e.full_message
        exit 1
    end

    def self.schema_file
      not_found = Proc.new { NotFoundError.new("Schemafile was not found") }
      [Rails.root.join('db', 'Schemafile.rb'), ENV['SCHEMA_FILE']].find(not_found) { |f| File.file? f }
    end
    private_class_method :schema_file
  end
end
