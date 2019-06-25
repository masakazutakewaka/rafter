# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/active_record/model/model_generator'

module ActiveRecord
  module Generators
    class ModelGenerator

      undef_method :create_migration_file

      def append_schema_file
        attributes.each { |a| a.attr_options.delete(:index) if a.reference? && !a.has_index? } if options[:indexes] == false
        append_file schema_file, schema_template(File.expand_path('../templates/schemafile.rb', __dir__)), { verbose: false }
      end

      private

      def schema_template(source)
        context = instance_eval("binding")
        if ERB.instance_method(:initialize).parameters.assoc(:key) # Ruby 2.6+
          ERB.new(::File.binread(source), trim_mode: "-", eoutvar: "@output_buffer").result(context)
        else
          ERB.new(::File.binread(source), nil, "-", "@output_buffer").result(context)
        end
      end

      def schema_file
        not_found = Proc.new { return }
        [Rails.root.join('db', 'Schemafile.rb'), ENV['SCHEMA_FILE']].find(not_found) { |f| File.file? f }
      end
    end
  end
end
