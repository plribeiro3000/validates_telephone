class Telephone
  def initialize(number)
    @match = number =~ /^(\(?\d{2}\)?)(\d{4})-?(\d{4})$/
    @number = number
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
    @cleaned_number =~ /^(\d{2})(\d{4})(\d{4})$/
    @number = "(#{$1})#{$2}-#{$3}"
  end
end