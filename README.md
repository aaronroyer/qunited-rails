# qunited-rails

Runs headless QUnit tests with [QUnited](https://github.com/aaronroyer/qunited) in your Rails 3 project.

## Configuration

Add the following to your Gemfile in your Rails 3 project:

```ruby
group :test, :development do
  gem 'qunited-rails'
end
```

The development group is necessary to run Rake tasks without having to type RAILS_ENV=test.

Next run Bundler to install the necessary gems.

```
$ bundle
```

## Running Tests

```
$ bundle exec rake test:javascripts
```

## Dependencies

Right now only Rhino is set up to run tests. This means you'll need to have Java (version 1.1 minimum) in your path to use qunited-rails.

## License

qunited-rails is MIT licensed
