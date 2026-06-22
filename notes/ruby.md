Include ActiveSupport in the irb console using `.irbrc` file:

```ruby
begin
  require 'active_support'
  require 'active_support/core_ext'
  Time.zone = "Melbourne"
rescue LoadError
  puts 'Active support not loaded'
end
```