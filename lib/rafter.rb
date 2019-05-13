# frozen_string_literal: true

require "rafter/version"
require "rafter/engine"

module Rafter
  class Schema
    def self.build
      conn_spec = YAML.load(File.read('config/database.yml').to_s)['development']
      client = Ridgepole::Client.new(conn_spec)
      dsl = File.read('db/Schemafile.rb')
      delta = client.diff(dsl)
      delta.migrate
    rescue => e
      raise ::Error.new(e)
    end
  end
end
