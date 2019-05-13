# frozen_string_literal: true

class Thor
  module Invocation
    def invoke_all #:nodoc:
      self.class.all_commands.delete('create_migration_file')
      self.class.all_commands.map { |_, command| invoke_command(command) }
    end
  end
end
