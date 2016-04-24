module Minsc
  module Rule
    @registry = {}

    def self.add_rule(klass, method)
       @registry[klass] ||= []
       @registry[klass] << method
    end

    def self.registry
      @registry
    end

    module ClassMethods
      def condition(method)
        Rule.add_rule(self, method)
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
      base.include(InstanceMethods)
    end
  end
end
