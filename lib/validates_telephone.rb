require 'validates_telephone/telephone_validator'
require 'validates_telephone/require_a_valid_telephone_matcher' if defined?(::Shoulda)

module ValidatesTelephone
  autoload :Validator, 'validates_telephone/validator'
  autoload :Regex, 'validates_telephone/regex'
  autoload :Formatter, 'validates_telephone/formatter'
end
