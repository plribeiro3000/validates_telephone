class TelephoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid, options) unless ValidatesTelephone::Validator.new(value, options[:locale]).valid?
  end
end