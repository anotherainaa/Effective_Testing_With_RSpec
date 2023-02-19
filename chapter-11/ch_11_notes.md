# Chapter 11

Chpater 11 is all about the different types of matchers
- primitive matchers
- higher-order matchers
- block matchers 

### Primitive matchers

The main point is identifying whether we need a
- identity equality - is it the same object? 
- value equality - is the value the same e.g `3 == 3.0`
- hash key equality - using `===` 

- Based on what we want to compare, there is a RSpec matcher that uses Ruby's built-int `equal` `==` `eql` `===` methods. 

Some things to look out for is checking equality for floating numbers
- the best way to tackle this problem is to use `be_within` in combination with other matchers to check that a value is within range e.g 2.999 and 3.00001 should match to 3.00
- or checking for if a value is 25% of x value
- why should we do this? To make sure that our test isn't super brittle

RSec has special matchers for checking methods with question mark e.g `success?` can be tested with `be_success` 
- a user that has an `admin?` method can be checked with `be_admin`
- what is a good guideline to use this, if we're checking the method itself, be succint and use `success?` equal to true, but if we're using the method to check if something is succesful or not, using `be_xx` can be useful. 

### Higher-order matchers
This type of matchers are basically used for checking collection of items. Note that a string is not a primitive value and we can use higher-order matchers like we'd use with arrays

- `contain_exactly`
- `all`
- `start_with?` `end_with?`
- `includes` 

- we can check attributes inside of a collection

We can also combine matchers with `and` and `or` to make sure that we can combine certain conditions. 
- this can be important for `be_empty` which can return `true` for empty collections but that may not be what we want.

Note that we should understand the concept of truthiness in Ruby in order to understand what kind of matchers we need. 

Note that if order is important we may want to use `equal` ???? and not `contain_exactly` where order doesn't matter

The point being depending on what we want, we may want to chain several matchers to help create the right test that is not brittle.

### Block matchers
Used when we need to check properties of code.

- `raise_error`
  - to check that a test raises an error, we can also tell it to expect a very specific error
  - need to be careful about false positives 
  - sometimes if we expect a test not to raise a specific error, a test can pass because a totally different error is raised. In that case, we should not define the specific error to be raised but instead should just say that an error should not be raised which would allow us to catch all errors raised and determine the cause
- `throw_symbol` - ??????
- `yield`
- `yield_args`
- we can also check how many times a code is yielded. 



