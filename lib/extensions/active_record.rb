# frozen_string_literal: true

require 'rails/generators/active_record/model/model_generator.rb'

module ActiveRecord
  module Generators # :nodoc:
    class ModelGenerator < Base # :nodoc:
      def append_schema_file #:nodoc
        attributes.each { |a| a.attr_options.delete(:index) if a.reference? && !a.has_index? } if options[:indexes] == false
        append_file "#{Rails.root.to_s}/db/Schemafile.rb", schema_template("../templates/schemafile.rb"), { verbose: false }
      end

      private

      def schema_template(source) #:nodoc
        source = File.expand_path(find_in_source_paths(source.to_s))
        context = instance_eval("binding")

        if ERB.instance_method(:initialize).parameters.assoc(:key) # Ruby 2.6+
          ERB.new(::File.binread(source), trim_mode: "-", eoutvar: "@output_buffer").result(context)
        else
          ERB.new(::File.binread(source), nil, "-", "@output_buffer").result(context)
        end
      end
    end
  end
end
