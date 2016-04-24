require_relative "../../lib/minsc/rule"
require "minitest/autorun"

class SampleRule
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
    rule = SampleRule.new("foo", "bar")
    assert_equal rule.applicable?, true

    rule2 = SampleRule.new("fizz", "buzz")
    assert_equal rule2.applicable?, false

    rule3 = SampleRule.new("fizz", "bar")
    assert_equal rule3.applicable?, false

    rule4 = SampleRule.new("foo", "buzz")
    assert_equal rule4.applicable?, false
  end
end
