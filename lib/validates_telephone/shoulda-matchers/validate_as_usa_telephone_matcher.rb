require "shoulda-matchers"

module Shoulda
  module Matchers
    module ActiveModel
      def validate_as_usa_telephone(attr)
        ValidateAsUsaTelephoneMatcher.new(attr)
      end

      class ValidateAsUsaTelephoneMatcher < ValidationMatcher
        def initialize(attribute)
          @attribute = attribute
        end

        def description
          "validate #{@attribute} as a valid Telephone number for United States"
        end

        def failure_message
          "expected #{@attribute} to be validated as a valid Telephone number for United States"
        end

        def matches?(subject)
          super(subject)

          disallows_invalid_value and allows_valid_value and allows_nil_value
        end

        private

        def disallows_invalid_value
          disallows_value_of("123456")
        end

        def allows_valid_value
          allows_value_of("(111)222-3333")
        end

        def allows_nil_value
          allows_value_of(nil)
        end
      end
    end
  end
end