class Telephone
  def initialize(number, locale)
    @number = number
    @locale = locale
    if @locale == :br
      @match = number =~ /^(\(?\d{2}\)?)(\d{4})-?(\d{4})$/
    else
      @match = number =~ /^(\(?[^2-9]\d{2}\)?)(\d{3})-?(\d{4})$/
    end
    @cleaned_number = $1.nil? ? nil : @number.gsub(/[\(\)-]/, "")
    format_number! if @cleaned_number
  end

  def valid?
    return false unless @number.nil? or @match
    true
  end

  def number
    @number
  end

  private

  def format_number!
    if @locale == :br
      @cleaned_number =~ /^(\d{2})(\d{4})(\d{4})$/
      @number = "(#{$1})#{$2}-#{$3}"
    else
      @cleaned_number =~ /^(\d{3})(\d{3})(\d{4})$/
      @number = "(#{$1})#{$2}-#{$3}"
    end
  end
end