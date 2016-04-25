module Minsc
  module Rule
    @registry = {}

    def self.add_condition(klass, method)
       @registry[klass] ||= []
       @registry[klass] << method
    end

    def self.registry
      @registry
    end

    module ClassMethods
      def condition(method)
        Rule.add_condition(self, method)
      end
    end

    module InstanceMethods
      def applicable?
        Rule.registry[self.class]
          .map { |method| send(method) }
          .uniq == [true]
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
    end
  end
end
