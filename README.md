[![Gem Version](https://badge.fury.io/rb/pbatcher.svg)](https://badge.fury.io/rb/pbatcher) [![Dependency Status](https://gemnasium.com/badges/github.com/wikiti/pbatcher.svg)](https://gemnasium.com/github.com/wikiti/pbatcher) [![CircleCI](https://circleci.com/gh/wikiti/pbatcher.svg?style=shield)](https://circleci.com/gh/wikiti/pbatcher)

# Process Batcher

Process Batcher (or `pbatcher`) is a ruby gem used to build quick CLI apps to process batches of tasks.

This project uses [`juwelier`](https://github.com/flajann2/juwelier) for managing and releasing this gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pbatcher'
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install pbatcher
```

## Usage

`pbatcher` uses a simple DSL syntax to construct applications.

For example, to create an application that takes an array of numbers, and calculate their double, and take only those
which are smaller than `30`:

```rb
require 'pbatcher'

pbatcher do
  # Define the iterator (data) to process
  iteration [1, 5, 10, 20]

  # Define the callback to process each item.
  processing { |x| x * 2 }

  # Validate the processed content
  # (double of x must be smaller than 30)
  validation { |x| x < 30 }

  # Name each item for output purposes
  naming { |x| "nº #{x}" }
end
```

This program will output the following:

```
Processing nº 1      [OK]
Processing nº 5      [OK]
Processing nº 10     [OK]
Processing nº 20     [FAIL]
```

## Options

The DSL includes the following methods within the `pbatcher` method:

| Method | Description | Argument | Default value |
| ------ | ----------- | -------- | ------------- |
| iteration | Data to iterate. Each item will be processed as an unique task. | `Enumerator`, `Proc`, or anything that respond to `:each`. | `[]` |
| processing | Items handler. A method which is run for each item. Any unhandled exception will result into a `FAIL` | A block, `proc` or a `lambda`. | `->(x) { x }` |
| validation | Validates the output of `processing` to mark the item as `OK` or `FAIL`. | A block, `proc` or a `lambda`. | `->(x) { true }` |
| naming | A simple method to given a human-readable name to each item. | A block, `proc` or a `lambda`. | `->(x) { x.to_s }` |
| logger | A logger item to inform about errors. Can be accessed via `logger` within the `pbatcher` context. | Any object that respond to any method supported by Ruby's `Logger` class. | `Logger.new('pbatcher.log')` |

## Authors

This project has been developed by:

| Avatar | Name | Nickname | Email |
| ------- | ------------- | --------- | ------------------ |
| ![](http://www.gravatar.com/avatar/2ae6d81e0605177ba9e17b19f54e6b6c.jpg?s=64)  | Daniel Herzog | Wikiti | [info@danielherzog.es](mailto:info@danielherzog.es) |
