require 'shoulda-matchers'
require 'active_support/core_ext/array/wrap'

module Shoulda
  module Matchers
    module ActiveModel
      def require_a_valid_telephone(attr = :telephone)
        RequireAValidTelephoneMatcher.new(attr)
      end

      class RequireAValidTelephoneMatcher< ValidationMatcher
        def initialize(attribute)
          @attribute = attribute
          @options = {}
        end

        def from(locale)
          @options[:locale] = locale
          self
        end

        def description
          "require #{@attribute} to be a valid telephone number"
        end

        def matches?(subject)
          super(subject)

          disallows_invalid_value and allows_valid_value
        end

        private

        def disallows_invalid_value
          return (disallows_value_of("123456") and disallows_value_of("(11)2222-3333")) if @options[:locale] == :usa
          return (disallows_value_of("123456") and disallows_value_of("(111)222-3333")) if @options[:locale] == :br
          disallows_value_of("123456")
        end

        def allows_valid_value
          return allows_value_of("(111)222-3333") if @options[:locale] == :usa
          return allows_value_of("(11)2222-3333") if @options[:locale] == :br
          allows_value_of("(111)222-3333") and allows_value_of("(11)2222-3333")
        end
      end
    end
  end
end