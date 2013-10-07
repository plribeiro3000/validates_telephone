require 'spec_helper'

describe ValidatesTelephone::Validator do
  context 'with br as locale' do
    context 'should be invalid with' do
      it '123456 as number' do
        ValidatesTelephone::Validator.new('123456', :br).should_not be_valid
      end

      it '12345678910 as number' do
        ValidatesTelephone::Validator.new('12345678910', :br).should_not be_valid
      end

      it "11811111111 as number" do
        ValidatesTelephone::Validator.new('11811111111', :br).should_not be_valid
      end
    end

    context 'should be valid with' do
      it 'blank number' do
        ValidatesTelephone::Validator.new('', :br).should be_valid
      end

      it 'nil as number' do
        ValidatesTelephone::Validator.new(nil, :br).should be_valid
      end

      it '1111111111 as number' do
        ValidatesTelephone::Validator.new('1111111111', :br).should be_valid
      end

      it '(11)11111111 as number' do
        ValidatesTelephone::Validator.new('(11)11111111', :br).should be_valid
      end

      it '111111-1111 as number' do
        ValidatesTelephone::Validator.new('111111-1111', :br).should be_valid
      end

      it '(11)1111-1111 as number' do
        ValidatesTelephone::Validator.new('(11)1111-1111', :br).should be_valid
      end

      it "(11)91111-1111 as number" do
        ValidatesTelephone::Validator.new('(11)91111-1111', :br).should be_valid
      end
    end

    context 'with a valid value' do
      it 'should return it formatted' do
        ValidatesTelephone::Validator.new('1111111111', :br).number.should == '(11)1111-1111'
      end

      it "should return it formatted(sp format)" do
        ValidatesTelephone::Validator.new('11911111111', :br).number.should == '(11)91111-1111'
      end
    end

    context 'with an invalid value' do
      it 'should return as it was' do
        ValidatesTelephone::Validator.new('123456', :br).number.should == '123456'
      end
    end
  end

  context 'with usa as locale' do
    context 'should be invalid with' do
      it '123456 as number' do
        ValidatesTelephone::Validator.new('123456', :usa).should_not be_valid
      end

      it '12345678910 as number' do
        ValidatesTelephone::Validator.new('12345678910', :usa).should_not be_valid
      end
    end

    context 'should be valid with' do
      it 'blank number' do
        ValidatesTelephone::Validator.new('', :usa).should be_valid
      end

      it 'nil as number' do
        ValidatesTelephone::Validator.new(nil, :usa).should be_valid
      end

      it '1111111111 as number' do
        ValidatesTelephone::Validator.new('1111111111', :usa).should be_valid
      end

      it '(11)11111111 as number' do
        ValidatesTelephone::Validator.new('(111)1111111', :usa).should be_valid
      end

      it '111111-1111 as number' do
        ValidatesTelephone::Validator.new('111111-1111', :usa).should be_valid
      end

      it '(111)111-1111 as number' do
        ValidatesTelephone::Validator.new('(111)111-1111', :usa).should be_valid
      end
    end

    context 'with a valid value' do
      it 'should return it formatted' do
        ValidatesTelephone::Validator.new('1111111111', :usa).number.should == '(111)111-1111'
      end
    end

    context 'with an invalid value' do
      it 'should return as it was' do
        ValidatesTelephone::Validator.new('123456', :usa).number.should == '123456'
      end
    end
  end

  context 'without locale' do
    context 'should be invalid with' do
      it '123456 as number' do
        ValidatesTelephone::Validator.new('123456').should_not be_valid
      end

      it '12345678910 as number' do
        ValidatesTelephone::Validator.new('12345678910').should_not be_valid
      end

      it '1111111111 as number' do
        ValidatesTelephone::Validator.new('1111111111').should_not be_valid
      end

      it '(11)11111111 as number' do
        ValidatesTelephone::Validator.new('(111)1111111').should_not be_valid
      end

      it '111111-1111 as number' do
        ValidatesTelephone::Validator.new('111111-1111').should_not be_valid
      end
    end

    context 'should be valid with' do
      it 'blank number' do
        ValidatesTelephone::Validator.new('').should be_valid
      end

      it 'nil as number' do
        ValidatesTelephone::Validator.new(nil).should be_valid
      end

      it '(11)1111-1111 as number' do
        ValidatesTelephone::Validator.new('(11)1111-1111').should be_valid
      end

      it '(111)111-1111 as number' do
        ValidatesTelephone::Validator.new('(111)111-1111').should be_valid
      end
    end
  end
end
