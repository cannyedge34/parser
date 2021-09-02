module Parser
  module Resolver
    class App
      def call(arg)
        arg.each_char.chunk_while { |curr, nxt| curr == nxt }.map(&:join).max_by(&:size)
      end
    end
  end
end
