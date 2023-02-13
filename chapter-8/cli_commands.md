
Running just the example tagged with `:fast`
```ruby
rspec --tag fast
```

Prefixing with a tilde(~) will cause RSpec to treat the name as an exclusion filter. 
- run all the examples that lack the `:fast` tag
```ruby
rspec --tag ~fast
```

Some shells treat `~` as special character, if so, quote the tag name as below.
```ruby
rspec --tag '~fast'
```

Note that the tags checks for truthiness, therefore, any value besides `nil` or `false` will match.

Sometimes, we care about a specific tag below, such as when we tag bug ID from bug tracking system.

We can run a spec as below.
```ruby
rspec --tag bug_id:123
```