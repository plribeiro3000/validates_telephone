require "active_model"
require "validates_telephone/telephone"

class TelephoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if options[:locale].nil?
      record.errors[attribute] << I18n.t("errors.messages.invalid") unless Telephone.new(value, :br).valid?
    else
      record.errors[attribute] << I18n.t("errors.messages.invalid") unless Telephone.new(value, options[:location]).valid?
    end
  end
end