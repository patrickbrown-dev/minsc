require "minsc"
require "minitest/autorun"

class FooBarRule
  include Minsc::Rule

  condition :is_foo?
  condition :is_bar?

  def initialize(foo, bar)
    @foo, @bar = foo, bar
  end

  private

  def is_foo?
    @foo == "foo"
  end

  def is_bar?
    @bar == "bar"
  end
end

class TestRule < Minitest::Test
  def test_applicable?
    rule1 = FooBarRule.new("foo", "bar")
    assert rule1.applicable?

    rule2 = FooBarRule.new("fizz", "buzz")
    refute rule2.applicable?

    rule3 = FooBarRule.new("fizz", "bar")
    refute rule3.applicable?

    rule4 = FooBarRule.new("foo", "buzz")
    refute rule4.applicable?
  end
end
