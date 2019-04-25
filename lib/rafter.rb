require "rafter/version"
require 'ridgepole'

module Rafter
  class Error < StandardError; end

  def self.build_schema
    conn_spec = YAML.load(File.read('config/database.yml').to_s)['test']
    client = Ridgepole::Client.new(conn_spec)
    dsl = File.read('db/Schemafile.rb')
    delta = client.diff(dsl)
    delta.migrate
  end
end
