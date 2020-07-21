# AttributeInquiry

Inspired by `Rails.env` and [ActiveSupport's StringInquirer](https://api.rubyonrails.org/classes/ActiveSupport/StringInquirer.html), this gem provides an easier way than overriding getter-methods for all string-attributes as:

```ruby
class User < ApplicationRecord
  def my_attribute
    ActiveSupport::StringInquirer.new(self[:my_attribute])
  end

  def type
    ActiveSupport::StringInquirer.new(self[:type])
  end

  ...
end
```

and replaces it by simply using

```ruby
class User < ApplicationRecord
  has_attribute_inquiry :my_attribute, :type
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attribute_inquiry'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attribute_inquiry

## Usage

1. Ensure the module `AttributeInquiry` is included and available in the class you're using it in.
2. Call `has_attribute_inquiry :attribute` somewhere.
3. Use it!

```ruby
class BaseModel
  include AttributeInquiry
end

class User < BaseModel
  has_attribute_inquiry :type

  ...
end

user = User.new(type: 'admin')

user.type.admin? #=> true
user.type.other? #=> false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/prograsdk/attribute_inquiry. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AttributeInquiry project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/prograsdk/attribute_inquiry/blob/master/CODE_OF_CONDUCT.md).
