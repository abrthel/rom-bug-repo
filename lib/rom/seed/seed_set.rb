require 'dry/core/class_attributes'

module ROM
  module Seed
    # Connects a relation and a set of data transformations
    # to take place on the relation
    class SeedSet
      extend ROM::Initializer

      # @!attribute [r] relation
      #   @return [Relation] Relation used when transforming data
      param :relation

      # @!attribute [r] __data__
      #   @return [Hash] Data to be applied to the relation
      #   @api private
      option :__data__, optional: true, default: -> { EMPTY_ARRAY }

      def unrestrict
        SeedSet::Unrestricted.new(self)
      end

      def data(*data)
        with(__data__: data)
      end

      def call
        __data__.each do |row|
          # Notes:
          # First test will create a command instance and cache it
          # in CommandCompiler @__registry__
          #
          # Requires command to be different with no meta options on first run
          cmd = relation.command(:create)
          cmd.call(row)
        end
      end
    end
  end
end

require 'rom/seed/seed_set/unrestricted'
