# handshakejs rubygem

Makes interacting with handshakejs easier in ruby.

```ruby
Handshakejs.salt = "your_long_secret_salt"
Handshakejs.valid?({email: email, hash: hash})
```

## Running Specs

```
bundle exec rspec
```

## Publish to RubyGems.org

You first need to request access from [scottmotte](http://github.com/scottmotte).

```
gem build handshakejs.gemspec
gem push handshakejs-0.0.1.gem
```


