class TelephoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    key = :"activerecord.errors.models.#{record.class.name.downcase}.attributes.#{attribute.to_s}.invalid"
    locale = (options[:locale] or :any)
    record.errors[attribute] << I18n.t(key, :default => :"activerecord.errors.messages.invalid") unless ValidatesTelephone::Validator.new(value, locale).valid?
  end
end