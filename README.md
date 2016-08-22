# Dancer

A small library to move forward or backward through Time in predefined steps.


## Installation

Add this line to your application's Gemfile:

```ruby
gem "dancer"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dancer


## Usage

### Basic usage

```ruby
now = Time.now

# takes 4 arguments: `start_at`, `end_at`, `step`, and `exclude_end` (like Range).
dancer = Dancer.new(now, now+86400, 3600, true)

dancer.each_time do |time|
  # do something...
end

dancer.each_range do |range|
  # do something...
end
```

### Usage with a Range

```ruby
# takes 2 arguments: `range` and `step`.
dancer = Dancer.range(now..(now+86400), 3600)

dancer.each_time do |time|
  # do something...
end
```

### Usage with an Extent

```ruby
# takes 4 arguments: `start_at`, `size`, `step` and `exclude_end`.
dancer = Dancer.extent(now, 24, 3600, true)

dancer.each_time do |time|
  # do something...
end
```

### Usage with an array of times

```ruby
# takes 3 arguments: `keys`, `step`, and `exclude_end`.
dancer = Dancer.extent(now, 24, 3600, true)

dancer.each_time do |time|
  # do something...
end
```

### Usage with a predefined step size

```ruby
TradingPeriod = Dancer::Defined.new(1800)

# accepts the same 4 methods but with `step` omitted from each
dancer = TradingPeriod.extent(now, 24, true)

dancer.each_time do |time|
  # do something...
end
```

### Other methods

```ruby
# takes 4 arguments: `start_at`, `end_at`, `step`, and `exclude_end` (like Range).
dancer = Dancer.new(now, now+86400, 3600, true)

dancer.size
> 24

dancer.duration
> 86400
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dancer.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
