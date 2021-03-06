require 'simplabs/excellent/checks/base'

module Simplabs

  module Excellent

    module Checks

      # This check reports nested iterators. Nested iterators may introduce performance issues.
      #
      # ==== Applies to
      #
      # * blocks
      class NestedIteratorsCheck < Base

        def initialize(options = {}) #:nodoc:
          super
          @interesting_contexts = [Parsing::BlockContext]
          @interesting_files    = [/\.rb$/, /\.erb$/]
        end

        def evaluate(context) #:nodoc:
          if context.inside_block?
            add_warning(context, '{{block}} inside of {{parent}}.', { :block => context.full_name, :parent => context.parent.full_name })
          end
        end

      end

    end

  end

end
