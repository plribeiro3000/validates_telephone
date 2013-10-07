module ValidatesTelephone
  module Regex
    def self.br(number)
      number =~ /^(\(?\d{2}\)?)(9)?(\d{4})-?(\d{4})$/
    end

    def self.usa(number)
      number =~ /^(\(?[^2-9]\d{2}\)?)(\d{3})-?(\d{4})$/
    end

    def self.any(number)
      number =~ /^(\(\d{2}\))(\d{4})-(\d{4})|(\([^2-9]\d{2}\))(\d{3})-(\d{4})$/
    end
  end
end
