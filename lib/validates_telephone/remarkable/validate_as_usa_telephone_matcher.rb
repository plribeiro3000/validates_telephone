require 'remarkable/active_record'

module Remarkable
  module ActiveRecord
    module Matchers
      class ValidateAsUsaTelephoneMatcher < Remarkable::ActiveRecord::Base
        arguments :telephone

        collection_assertions :telephone_valid?, :allow_nil?, :formatted_number?

        protected

        def telephone_valid?
          @subject.telephone = '123456'
          @subject.valid?.errors[:telephone].should == ['is invalid']
        end

        def allow_nil?
          @subject.telephone = nil
          @subject.valid?.errors[:telephone].should == []
        end

        def formatted_number?
          @subject.telephone = '1112223333'
          @subject.valid?.telephone.should == '(111)222-3333'
        end
      end

      def validate_as_usa_telephone(*args, &block)
        ValidateAsUsaTelephoneMatcher.new(*args, &block).spec(self)
      end
    end
  end
end