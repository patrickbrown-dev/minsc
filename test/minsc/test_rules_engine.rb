require_relative "../../lib/minsc/rules_engine"
require "minitest/autorun"

class FooRule
  include Minsc::Rule

  condition :is_foo?

  def initialize(foo)
    @foo = foo
  end

  def execute
    "executed foo rule"
  end

  private

  def is_foo?
    @foo == "foo"
  end
end

class BarRule
  include Minsc::Rule

  condition :is_bar?

  def initialize(bar)
    @bar = bar
  end

  def execute
    "executed bar rule"
  end

  private

  def is_bar?
    @bar == "bar"
  end
end

class FooOrBarRule
  include Minsc::Rule

  condition :foo_or_bar?

  def initialize(foo_or_bar)
    @foo_or_bar = foo_or_bar
  end

  def execute
    "executed foo_or_bar rule"
  end

  private

  def foo_or_bar?
    @foo_or_bar == "foo" || @foo_or_bar == "bar"
  end
end

class FooBarRulesEngine
  include Minsc::RulesEngine

  rule FooRule
  rule BarRule
  rule FooOrBarRule
end

class TestRulesEngine < Minitest::Test
  def test_rule_execution
    rules1 = FooBarRulesEngine.execute("foo")
    assert_equal rules1, ["executed foo rule", "executed foo_or_bar rule"]

    rules2 = FooBarRulesEngine.execute("bar")
    assert_equal rules2, ["executed bar rule", "executed foo_or_bar rule"]

    rules3 = FooBarRulesEngine.execute("fizz")
    assert_equal rules3, []
  end
end
