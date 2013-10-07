module ValidatesTelephone
  class Validator
    def initialize(number, locale = :any)
      locale ||= :any
      @number = number
      @match = ValidatesTelephone::Regex.send(locale, @number)
      @number = ValidatesTelephone::Formatter.send(locale, @number)
    end

    def valid?
      return true if @number.blank?
      @match
    end

    def number
      @number
    end
  end
end