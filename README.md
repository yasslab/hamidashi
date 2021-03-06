# Hamidashi
[![Build Status](https://travis-ci.org/yasslab/hamidashi.svg?branch=master)](https://travis-ci.org/yasslab/hamidashi)
[![Code Climate](https://codeclimate.com/github/yasslab/hamidashi/badges/gpa.svg)](https://codeclimate.com/github/yasslab/hamidashi)
[![Test Coverage](https://codeclimate.com/github/yasslab/hamidashi/badges/coverage.svg)](https://codeclimate.com/github/yasslab/hamidashi/coverage)

Detect PDF text overflow.

## Requirements

- ImageMagick

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hamidashi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hamidashi

## Usage

    $ hamidashi -h
    Hamidashi
    =========
    Detect PDF text overflow.

    Usage:
      exe/hamidashi <name> [--margin=<margin>]
      exe/hamidashi preview <name> [--margin=<margin>] [--page=<page>]
      exe/hamidashi -h | --help
      exe/hamidashi --version

    Options:
      -h --help          Show this screen.
      --version          Show version.
      --page=<page>      Show specified page [default: 10].
      --margin=<margin>  Right margin percentage [default: 4.375].

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yasslab/hamidashi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

Copyright &copy; 2015-2017 [YassLab](http://yasslab.jp).

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[![YassLab](https://yasslab.jp/img/logo_800x200.png)](https://yasslab.jp/)
