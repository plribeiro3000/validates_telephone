#Validator
require "validates_telephone/telephone_validator"

#Rspec Matchers
require "validates_telephone/shoulda-matchers/require_a_valid_telephone_matcher" if defined?(::Shoulda)
require "validates_telephone/remarkable/require_a_valid_telephone_matcher" if defined?(::Remarkable)

module ValidatesTelephone
  autoload :Validator, "validates_telephone/validator"
  autoload :Regex, "validates_telephone/regex"
  autoload :Formatter, "validates_telephone/formatter"
end