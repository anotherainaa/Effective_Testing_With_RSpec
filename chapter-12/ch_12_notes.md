# Chapter 12

Chpater 12 focuses on teaching you how to defin your own matchers
- How to create aliases for existing RSpec expectations (to customise the domain language for readability)
- Use the provided DSL 
- Create a custom matcher using plain old Ruby classes
  - this works as long as you implement the matcher protocol 

How to create alises? 
- Use configuration? 
- For example, aliasing `hash` to the custom object the test expects
  - note that you should try to add details so that the alias only works with your custom domain problem and not other hashes that should not be used with this matcher

What to note when creating your own matchers
- How to create one using DSL 
- Make sure they're included in the configuration
- the files where you may want to put your custom matchers
- How to make your custom matchers be able to
  - use fluent interfaces
  - make use of composable matchers
    - use RSpec's `values_match?` method
  - and / or compound expressions can be used by default.
- When writing a custom matcher for your project, favor DSL 
  - when writing a library that should work with other testing frameworks, use classes

What is the matcher protocol? 
- must implement
  - `matches`
  - may want to include `RSpec` module if you want to use RSpec's built in method - with the caveat that it will become a dependency
  - you can opt out of using RSpec module if you want to make the matcher available outside of RSpec e.g writing a library for using a different test framework etc
- need to know when to return `self` when using some other objects in out custom methods. 

### Keywords
- Composable matchers e.g
  - `expect(account).to have_a_balance_of(a_value < 11_000_000)`
  - `expect(account).to have_a_balance_of(a_value_within(50).of(10_500_000))`
  - a matcher used within a matcher. 
- Compound expression e.g `and` `or`