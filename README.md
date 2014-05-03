# handshakejs rubygem

Makes interacting with handshakejs easier in ruby.

[![Build Status](https://travis-ci.org/handshakejs/handshakejs-ruby.svg?branch=master)](https://travis-ci.org/handshakejs/handshakejs-ruby)
[![Gem Version](https://badge.fury.io/rb/handshakejs.svg)](http://badge.fury.io/rb/handshakejs)

```ruby
Handshakejs.salt = "your_long_secret_salt"
Handshakejs.validate({:email => email, :hash => hash})
```

## Running Specs

```
bundle exec rspec
```

## Publish to RubyGems.org

You first need to request access from [scottmotte](http://github.com/scottmotte).

```
gem build handshakejs.gemspec
gem push handshakejs-0.0.2.gem
```


