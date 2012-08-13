module ValidatesTelephone
  class Validator
    def initialize(number, locale = :any)
      @number = number
      @match = ValidatesTelephone::Regex.send(locale, @number)
      @number = ValidatesTelephone::Formatter.send(locale, @number)
    end

    def valid?
      return true if @number.nil?
      @match
    end

    def number
      @number
    end
  end
end