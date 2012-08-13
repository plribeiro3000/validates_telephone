module ValidatesTelephone
  module Formatter
    def self.br(number)
      return nil if number.nil?
      number.gsub(/[\(\)-]/, "") =~ /^(\d{2})(\d{4})(\d{4})$/
      return number if $1.nil?
      "(#{$1})#{$2}-#{$3}"
    end

    def self.usa(number)
      return nil if number.nil?
      number.gsub(/[\(\)-]/, "") =~ /^(\d{3})(\d{3})(\d{4})$/
      return number if $1.nil?
      "(#{$1})#{$2}-#{$3}"
    end

    def self.any(number)
      number
    end
  end
end