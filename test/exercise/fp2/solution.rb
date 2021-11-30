module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def block_for_my_each(collection, block)
        return if collection.empty?

        first, *rest = collection
        block.call(first)
        block_for_my_each(rest, block)
      end

      def my_each(&block)
        block_for_my_each(self, block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        new_collection = ->(result, element) { result << block.call(element) }
        my_reduce(self.class.new, &new_collection)
      end

      # Написать свою функцию my_compact
      def my_compact
        new_collection = ->(result, element) { !element.nil? ? result << element : result }
        my_reduce(self.class.new, &new_collection)
      end

      def block_for_my_reduce(collection, acc, block)
        return acc if collection.empty?

        first, *rest = collection
        acc = acc.nil? ? first : block.call(acc, first)
        block_for_my_reduce(rest, acc, block)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        block_for_my_reduce(self, acc, block)
      end
    end
  end
end
