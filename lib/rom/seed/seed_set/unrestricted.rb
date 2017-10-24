module ROM
  module Seed
    class SeedSet
      class Unrestricted
        extend Initializer

        param :seedset

        def call
          seedset.__data__.each do |tuple|
            # Notes:
            #
            # Where the magic happens. Doesn't matter what options are passed
            # in the test will pass, however drop the option and Relation#command
            # will pull the create command from the compiler cache and the test
            # will fail.
            #
            # For some reason, after tables have been dropped the cached version
            # of the users relation create command thinks that the user table
            # doesn't exist but upon invalidating that cache (by using a meta option)
            # a new command is compiled and the command works like normal.
            cmd = seedset
                    .relation
                    .command(:create, rick: :sanchez)
            cmd.call(tuple)
          end
        end
      end
    end
  end
end
