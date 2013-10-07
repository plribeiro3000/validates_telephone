# ValidatesTelephone 

[![Gem Version](https://badge.fury.io/rb/validates_telephone.png)](http://badge.fury.io/rb/validates_telephone) [![Build Status](https://secure.travis-ci.org/plribeiro3000/validates_telephone.png?branch=master)](http://travis-ci.org/plribeiro3000/validates_telephone) [![Dependency Status](https://gemnasium.com/plribeiro3000/validates_telephone.png)](https://gemnasium.com/plribeiro3000/validates_telephone) [![Coverage Status](https://coveralls.io/repos/plribeiro3000/validates_telephone/badge.png?branch=master)](https://coveralls.io/r/plribeiro3000/validates_telephone)  [![Code Climate](https://codeclimate.com/github/plribeiro3000/validates_telephone.png)](https://codeclimate.com/github/plribeiro3000/validates_telephone)

Validates telephone and test it in a simple way

## Installation

Add this line to your application's Gemfile:

    gem 'validates_telephone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_telephone

## Basic Usage

It will accept a valid telephone from Brazil or United States by default:

```ruby
class User < ActiveRecord::Base
    validates :telephone, :telephone => true
end
```

In case you want it to be a valid telephone for just one place at a time, pass the locale:

```ruby
class User < ActiveRecord::Base
    validates :br_telephone, :telephone => { :locale => :br }
    validates :usa_telephone, :telephone => { :locale => :usa }
end
```

## Notes

It will load a matcher to test automatically if the gem is defined after shoulda-matchers.

## Mantainers
[@plribeiro3000](https://github.com/plribeiro3000)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request