# Chapter 14

This chapter provides more details on how to customize test doubles that we discussed in Chapter 13

## Summary

## Notes

### Configuring response 

Examples
```ruby
allow(double).to receive(:a_message).and_return(a_return_value)
allow(double).to receive(:a_message).and_raise(AnException)

# For partial doubles
allow(object).to receive(:a_message).and_call_original
allow(object).to receive(:a_message).and_wrap_original { |original| }
```

#### Returning multiple values

What if we want to return different values in the first call, second one and so on.
- we can pass multiple values to `and_return`

```ruby
allow(random).to receive(:rand).and_return(0.1, 0.2, 0.3)
random.rand
# => 0.1
random.rand
# => 0.2
random.rand
# => 0.3
random.rand
# => 0.3
```
We give 3 return values, note how after the third call, it continues to return the last value we gave it

#### Yielding Multiple Values

How can we make double yield values? 
- use `and_yield` method

How to specify a sequence of values to yield? 
- chain together multiple calls to `and_yield`

```ruby
extractor = double('TwitterURLExtractor')

allow(extractor).to receive(:extract_urls_from_twitter_firehse)
  .and_yield('https://rspec.info/', 93284234987)
  .and_yield('https://github.com/', 43984523459)
  .and_yield('https://pragprog.com/', 33745639845)
```

- when the code we're testing calls `extract_urls_from_twitter_firehose` with a block, the method will yield to the block 3 times. 
- each time the block will receive a URL and a numeric tweet ID 

#### Raising exceptions flexibly

```ruby
allow(dbl).to receive(:msg).and_raise(AnExceptionClass)
allow(dbl).to receive(:msg).and_raise('an error message')
allow(dbl).to receive(:msg).and_raise(AnExceptionClass, 'with a message')

an_exception_instance = AnExceptionClass.new
allow(dbl).to receive(:msg).and_raise(an_exception_instance)
```
Pure test doubles - they have to be told exactly how to respond
- because they don't have an existing implementation


#### Falling Back to the Original implementation

Partial doubles begin as a real object, with real method implementations
- we case the fake version on the real one.

- We may want to use fake implementation of certain parameter values, but fall back on the real method the rest of the time. 
- In these cases, you can `expect` or `allow` twice. 
  - once like normal
  - and once with `and_call_original` to provide the default behaviour

```ruby
allow(File).to receive(:read).with('/etc/passwd').and_raise('HAHA NOPE')

# fallback
allow(File).to receive(:read).and_call_original
```

#### Modifying the Return value

changing the behvaior of the method we're stubbing slightly
  - rathen than replacing it outright
  - for example, modify its return value

here is an example of using this technique to stub out a `CustomerService` API
```ruby
allow(CustomerService).to receive(:all).and_wrap_original do |original|
  all_customers = original.call
  all_customers.sort_by(&:id).take(10)
end
```

- handy for testing against a live service
  - if the vendor doesn't provide a test API that only returns a few records, you can call the real API and narrow down the reords yourself. 
  - working on a subset of data, allows specs to be fast/


#### Tweaking arguments

handy when the code we're testing uses a lot of hard-coded values. 
- if the number is not defined as constant and we want to change it, e.g hard-coded-value, we can override it using `and_wrap_original`

```ruby
allow(PasswordHash).to receive(:hash_password)
  .and_wrap_original do |original, cost_factor|
  original.call(1)
end
```

- `and_call_original` and `and_wrap_original` only makes sense for partial doubles

#### When you need more flexibility

- when the behaviour required is outside what the techniques provide. 
- for example, simulating bad network


```ruby
counter = 0

allow(weather_api).to receive(:temperature) do |zip_code|
  counter = (counter + 1) % 4
  counter.zero? ? raise(Timeout::Error) : 35.0
end
```

don't get carried away with blocks
- if the code is more complex than above, we should move it into its own Ruby class. 
- Martin Fowler refers to this kind of stand-in as a fake
- fakes are particularly useful when you need to preserve state across multiple method calls.


--- 

### Setting constraints

#### Constraining arguments

- `.with` to constraint arguments
- we ca also use with `allow`

#### Argument Placeholders

- use `.with` with `anything` to let the arguments be anything

- `any_args`

#### Hashe and keywords arguments

- `hash_including`
- `hash_excluding`
- `options` before Ruby 2.0
- arguments, 2.0 onwards

#### Custom logic

- repeating the same complex constrains in several specs
- supply your own custom logic


#### Costrainging how many times a method get called

- `.thrice.and_raise` 

#### Ordering

making RSpec enforcing a specific order. 

```ruby
expect(greeter).to receive(:hello).ordered
expect(greeter).to receive(:goodbye).ordered
```

- a sign that specs may be too coupled to one particular implementation


