require "active_model"
require "validates_telephone/telephone"

class TelephoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << I18n.t("errors.messages.invalid") unless Telephone.new(value).valid?
  end
end