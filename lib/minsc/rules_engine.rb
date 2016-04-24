module Minsc
  module RulesEngine
    @registry = {}

    def self.add_rule(klass, rule)
      @registry[klass] ||= []
      @registry[klass] << rule
    end

    def self.registry
      @registry
    end

    module ClassMethods
      def execute(*args)
        RulesEngine.registry[self]
          .map { |rule_class| rule_class.new(*args) }
          .select(&:applicable?)
          .map(&:execute)
      end

      def rule(rule_class)
        RulesEngine.add_rule(self, rule_class)
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
