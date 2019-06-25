# Rafter

This gem is a Rails plugin for [ridgepole](https://github.com/winebarrel/ridgepole), a database schema manager.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
# ...
  gem 'rafter'
# ...
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rafter

## Usege
Once you install the gem, it automatically does the followings for you.

- apply your schema file to the test database with ridgepole before spec is run
- update your schema file when a model is generated with Rails CLI (`rails generate model ...`)
- apply your schema file when databases are setup with Rails tasks (`rails db:setup`, `rails db:reset`)

The path to your schema file defaults to `/app_root/db/Schemafile.rb`.

You can change it by setting the env variable `SCHEMA_FILE`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masakazutakewaka/rafter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
