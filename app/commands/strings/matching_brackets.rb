# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
# An input string is valid if:
#   Open brackets must be closed by the same type of brackets.
#   Open brackets must be closed in the correct order.
#   Every close bracket has a corresponding open bracket of the same type.

# check(matching_brackets_valid?('{{}}'), true)
# check(matching_brackets_valid?('{{[]}}'), true)
# check(matching_brackets_valid?('{[{}]}'), true)
# check(matching_brackets_valid?('({{}})'), true)
# check(matching_brackets_valid?('{[()]}'), true)
# check(matching_brackets_valid?('{{}[}'),false)
# check(matching_brackets_valid?('{{]}}'),false)
# check(matching_brackets_valid?('{}}'),false)
# check(matching_brackets_valid?('{({}}'),false)
# check(matching_brackets_valid?('((}}'),false)
# check(matching_brackets_valid?('}[)}'),false)
# check(matching_brackets_valid?("()" ), true)
# check(matching_brackets_valid?("[]" ), true)
# check(matching_brackets_valid?("{}" ), true)
# check(matching_brackets_valid?("(){}[]" ), true)
# check(matching_brackets_valid?("([{}])" ), true)
# check(matching_brackets_valid?("(}" ),false)
# check(matching_brackets_valid?("[(])" ),false)
# check(matching_brackets_valid?("({})[({})]" ), true)
# check(matching_brackets_valid?("(})" ),false)
# check(matching_brackets_valid?("(({{[[]]}}))") ,true)
# check(matching_brackets_valid?("{}({})[]" ), true)
# check(matching_brackets_valid?(")(}{][" ),false)
# check(matching_brackets_valid?("())({}}{()][][" ),false)
# check(matching_brackets_valid?("(((({{" ) ,false)
# check(matching_brackets_valid?("}}]]))}])" ),false)

# def check(result, expected = false)
#   result
# end

module Strings
  class MatchingBrackets
  prepend SimpleCommand

  def matching_brackets_valid?(string_data)
    return true if string_data.blank?

    brackets = { '{' => '}', '[' => ']', '(' => ')' }
    stacks = []
    brackets_keys = brackets.keys
    brackets_values = brackets.values

    string_data.chars.each do |char|
      if brackets_keys.any?(char)
        stacks << brackets[char]
      elsif brackets_values.any?(char)
        return false if stacks.pop != char
      end
    end

    stacks.empty?
  end
end
