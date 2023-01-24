Notes that can possibly be turned into flashcards. 

### What does the code `RSpec.describe` do? 
```ruby
RSpec.describe 'An ideal sandwich' do
  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])

    taste = sandwich.taste
    
    expect(taste).to eq('delicious')
  end
end​
```
- The outer `RSpec.describe`block creates an _example group_. 
- An example group defines what you're testing - in this case, a sandwich, whereby related specs are kept together. 

### What do we call the nested `it 'is delicious'` nested block? 
- It's an example of the sandwich's use - commonly known as a test case.

### Describe the code inside the `it 'is delicious'` nested block. 
- We create a `Sandwich`, ask for it's `taste`, and verify that the result is `delicious`. 
- The line beginning with `expect` is an _expectation_. These are like assertion but with a few extra bits. (as will be seen in later chapters).

### What's the difference between `test`, `specs` and `examples`? 
- A `test` validates that a bit of code is working properly. 
- A `spec` describes the desired behaviour of a bit od code. 
- An `example` show how a particular API is intended to be used.

### What is the purpose of ths specs for you sandwich as per example? 
- Documenting what your sandwich should do
- Checking that the sandwich does what it's supposed to do
- In this case, in other words, it should be clear to someone new to the project that a sandwich should be delicious. 

### How is the `expect` code different from traditional test framework's assertions?
- It reads like English compared to tradition style e.g `assert_equal(​'delicious'​, taste, ​'Sandwich is not delicious'​)`. 

### How do we know if a test fails? 
- RSpec gives a detailed report showing which spec failed. Failing specs are highlighted in red.

### When/Why would you want to share setup? 
- We use it to keep code dry, by avoiding having to repeat setup code. 

### How do you share setup? 
- Hooks. RSpec has a `before hook` which will run automatically before each example.
```ruby
RSpec.describe ​'An ideal sandwich'​ ​do​
  ​before​ { @sandwich = Sandwich.new(​'delicious'​, []) }
end
```
- Note that the code is shared across specs but the individual `Sandwich` instance is not.
- Also note usage of instance variable `@sandiwch` instead of local variable
- Why is this important? So that we have the confidence that changing toppuings for example, will not impact other test cases.

### What are hooks good for? 
- For running common setup code that has real world side effects.
- e.g need to clear out a test database before each example, use hooks.

### What are the drawbacks of using instance variables? 
- uninitialized instance variables return nil, therefore if we accidentaly make a typo, it will return `nil` instead of aborting with a failure right away which may result in a confusing error message.
- if we used local variables before, we now need to refactor everything to instance variables.
- by using a `before` hook we will pay the cost of setup for all the examples in the group, even if some never use it. This can be inefficient and noticeable when setting up large or expensive objects.

### How do you negate your expectation? 
- Use `not_to` instead of `to` e.g `expect(toppings).not_to be_empty`

### What are the 3 different techniques shared in the book for sharing setup? 
- hook - specifically `before` hook which can be combined with instance variables
- helper method + memoization - we can use local variables instead of instance variables, but we need to make sure that the helper method does not return a new instance each time which is where memoization helps. 
- let - RSpec's specific method that handles the edge case that can happen with memoization.

### Why do we need to use memoization if we use helper methods to help with setup? 
- To ensure that we're not calling the helper method each and getting a new instance every single time. Which would then fail the test.

### What is the downside of using the `||=` pattern?
- It doesn' work the way we imagine it to be and will potentially run code unefficiently if we're trying to store something falsey in the variable. 
- Take the code below, the intention is to store `nil` value for `@current_toaster` if it isn't found,but what actually really happens is that, storing falsey values means the code on the right side will always be executed - which means memoization is not happening.

```ruby
def current_toaster
  @current_toaster = nil ||= Toaster.find_by_serial('HHGG42')
end
```


### What is RSpec's way of handling the problem mentioned above? 
- Sharing objects with `let`.

### What does `let` do? 
- Think of `let` as binding a name (sandwich) to the result of a computation (the block).

### When should we use `let` etc? 
- Use them where the improve maintainability, lessen noise and increase clarity.

## Exercises

1. We’ve shown you three primary ways to reduce duplication in RSpec: hooks, helper methods, and let declarations. Which way did you like best for this example? Why? Can you think of situations where the others might be a better option?


2. Run rspec --help and look at the available options. Try using a few of them to run your sandwich examples.
