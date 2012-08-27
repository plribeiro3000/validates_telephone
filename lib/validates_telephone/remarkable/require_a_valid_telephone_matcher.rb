require 'remarkable/active_model'

module Remarkable
  module ActiveModel
    module Matchers
      class RequireAValidTelephoneMatcher < Remarkable::ActiveModel::Base
        arguments :telephone

        optional :locale

        collection_assertions :telephone_valid?, :telephone_invalid?

        protected

        def telephone_valid?
          return allows_value_of("(111)222-3333") if @options[:locale] == :usa
          return (allows_value_of("(11)2222-3333") and allows_value_of("(11)91111-1111")) if @options[:locale] == :br
          allows_value_of("(111)222-3333") and allows_value_of("(11)2222-3333")
        end

        def telephone_invalid?
          return (disallows_value_of("123456") and disallows_value_of("(11)2222-3333")) if @options[:locale] == :usa
          return (disallows_value_of("123456") and disallows_value_of("(111)222-3333") and disallows_value_of("(11)81111-1111")) if @options[:locale] == :br
          disallows_value_of("123456")
        end

        def allows_value_of(telephone)
          @subject.telephone = telephone
          @subject.valid?.errors[:telephone].should be_blank
        end

        def disallows_value_of(telephone)
          @subject.telephone = telephone
          @subject.valid?.errors[:telephone].should == ['is invalid']
        end
      end

      def require_a_valid_telephone(*args, &block)
        RequireAValidTelephoneMatcher.new(*args, &block).spec(self)
      end
    end
  end
end
