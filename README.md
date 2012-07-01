# qunited-rails

Runs headless QUnit tests with [QUnited](https://github.com/aaronroyer/qunited) in your Rails 3 project.

## Installation

```
$ gem install qunited-rails
```

This installs the following gems:
```
qunited
qunited-rails
```

## Configuration

Add the following to your Gemfile:

```ruby
group :test, :development do
  gem 'qunited-rails'
end
```

The development group is necessary to run Rake tasks without having to type RAILS_ENV=test

## Running Tests

In your Rails project:

```
$ bundle exec rake test:javascripts
```

## Dependencies

Right now only Rhino is set up to run tests. This means you'll need to have Java (version 1.1 minimum) in your path to use qunited-rails.

## License

qunited-rails is MIT licensed
