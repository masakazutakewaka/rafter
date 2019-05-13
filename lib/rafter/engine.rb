# frozen_string_literal: true

require '../extensions/thor'
require '../extensions/active_record'

module Rafter
  class Engine < Rails::Engine #:nodoc:
    PATCH_FILES = %w( ../extensions/thor.rb ../extensions/active_record.rb)
    initializer 'Rafter' do
      PATCH_FILES.each(:load)
    end
  end
end
