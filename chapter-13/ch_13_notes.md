# Chapter 13

- The beginning of Part 5. 

### Summary

#### Usage mode
Types of test doubles as defined by Gerard Meszaros in xUnit Test Patterns. This refers to the usage mode 
- stub
  - returns canned responses, avoiding meaningful computation or I/O
- mock
  - expects specific messages, will raise an error if it doesn't receive them by the end of the example
- null object
  - a bening test double that can stand in for any object, returns itself in response to any message
- spy
  - records the message it receives, so that you can check them later

#### Origin
A test double has an origin: indicating what it's Ruby original class is. Some doubles are based on real Ruby objects while some are totally fake
- pure double
  - a double whose behaviour comes entirely from the test framework
  - what people normally think of when they think of mock objects
- partial double
  - an existing ruby object that takes on some test double behaviour
  - its interface is a mixture of real and fake implementation
- verifying double
  - totally fake like a pure double
  - constraints its interface based on a real object like a partial doubl
  - provides a safer test double by verifying that it matches the API it's standing for
- stubbed constant
  - a ruby constant, such as class or module name
  - we create, remove or replace for a single test

### Questions

What does it mean when we say a test double will have both an origin and a usage mode.
- We may have a pure double acting as a stub, or a verifying double acting as a spy

What does the `double` method do ? 
- creates a generic test double
- we can call it with no arguments

What's the difference between a generic double than a regular Ruby object? 
- It gives you more debugging information than regular Ruby object.

What does it mean that doubles are strict by default? 
- It means that they will reject all messages except the ones that we've specifically allowed. 

What happens when you `record` a message (that is not allowed) on a test double?
- The double will raise an exception

How do you give a name to a double? And what happens in an error message? 
- pass a name to the `double` method e.g `ledger = double('Ledger')`
- the error message would not contain the role name of the double e.g Ledger
- Why it useful? - It's handy when you're using multiple doubles in the same example and need to tell them apart

What kinds of test doubles can we create using `double`? 
- We can create stubs, mocks, spied and null objects. 

#### Stubs

What are stubs? What do they do? 
- The return pre-programmed, canned responses. 
- Stubs are best for when you're stimulating query methods - methods that return a value but don't perform side effects. 

What is the simplest way to define a stub? 
- Pass a hash method of names and return values to the `double` method 
- e.g `http_response = double('HTTPResponse', status: 200, body: 'OK')`

What is the alternative way to define a stub? 
- Perform the above in two steps
  - creating the stub
  - setting up the canned messages separately

```ruby
http_response = double('HTTPResponse') # => #<Double "HTTPResponse">
allow(http_response).to receive_messages(status: 200, body: 'OK') # => {:status=>200, :body=>"OK"}
http_response.status # => 200
http_response.body # => "OK"
```

The hash syntax is short for what? 
```ruby
allow(http_response).to receive(:status).and_return(200)
# => #<RSpec::Mocks::MessageExpectation #<Double "HTTPResponse">.status(any arguments)>
allow(http_response).to receive(:body).and_return('OK')
# #<RSpec::Mocks::MessageExpectation #<Double "HTTPResponse">.body(any arguments)>
```

What is the verbose syntax good for? 
- For when we need more precision. Wait til next chapter.

Do stubs act differently based on their arguments? 
- No, they ingnore their arguments
```ruby
http_response.status(:args, :are, :ignored)
# => 200
http_response.body(:blocks, :are, :also) { :ignored }
# => "OK"
```

How to express expected parameters and return values more precisely? 
- Will be seen in next chapter

What kind of behavior do stubs help test? 
- The kind that can be verified by just looking at return values. 

What will the method we're testing typically do? 
- Query data from a dependency
- Perform a computation on that data
- return a result

How can our specs check the object's behaviour? 
- Looking at the return value in step 3
- What does the stub do? 
  - hand back an appropriate reply to the query at step 1

What happens when you need to test an object that doesn't fit into this pattern? 
- Turn to another kind of test double desgined for this use case: a mock object

#### Mocks

Wat are mocks good for? 
- Good for dealing with _command methods_
- What does it mean? - Its not a return value we care about, it's a _side effect_

What is a typical sequence example? 
1. Receive an event from the system
2. make a decision based on that event
3. perform an action that has a side effect

What is an example described in the book? 
- a chat bot's Reply feature may receive a text message, decide how to reply and then post a message in the chat room
- to tes this, it's not enough for the test double to provide a fixed return value
- it needs to make sure the object triggered the side effect of posting a message correctly

What does `RSpec::Mocks.verify` does? 
- Tries to check if it receives a message it's expecting.

How do you specify the opposite behaviour? 
- `expect(ledger).not_to recieve(:reset)`
- we can see more fine-grained expectations than just receiving or not receiving

```ruby
require 'rspec/mocks/standalone'
ledger = double('Ledger')
expect(ledger).to receive(:record)
RSpec::Mocks.verify # will only pass if it receives the correct number of times expected? 
```

#### Null objects

What if you test double needs to receive several messages? 
- Making them strict can make your test brittle

What's the solution? 
- Use a test double that is more forgiving, null objects

How to create a null object test double? 
- you can convert any test double to a null object by calling `as_null_object` on it

```ruby
yoshi = double('Yoshi').as_null_object
# => #<Double "Yoshi">
yoshi.
# => #<Double "Yoshi">
```

What is another name of null object? 
- _black hole_

What does null objects do? 
- It responds to any message sent to it
- and it always returns itself
- you can also chain one method call after another

```ruby
yoshi.eat(:apple).then_shoot(:shell).then_stomp
# => #<Double "Yoshi">
```

What does it mean that null objects are the placebos of the testing world? 
- They're benigin objects that do nothing
- they can stand in for anything
- they can satisfy any interface

What is an example defined in the book? 
- Say we have a `ChatBot` class that interact with `room` and `user`
- we may want to test these collaborations separately
- while focusing on the user-related specs, we can use a null object for the room

#### Spies

What is the downside of traditional mocks?
- the disrupt the normal Arrange/Act/Assert sequence you're used to in your test.

```ruby
class Game
  def self.play(character)
    character.jump
  end
end

# First, we'll arrange our test double
mario = double('Mario')

# Then assert that it will receive the jump message
expect(mario).to receive(:jump)

# act by playing the game
Game.play(mario)
```

- Normally, we will have assert before acting, therefore this feels a bit unnatural

What does spies do? 
- One way to restore the traditional flow.

How? 
- Change the `receive` expectation to `have_received`
- then, we can move expectation to the end

```ruby
mario = double('Mario').as_null_object
# #<Double "Mario">
Game.play(mario)
# #<Double "Mario">
expect(mario).to have_received(:jump)
# =>  nil
```

What do we have to note of when spying on object with `have_received`? 
- we either need to use null objects or explicitly `allo` the expected message

```ruby
mario = double('Mario').as_null_object
# #<Double "Mario">
allow(mario).to receive(:jump)
# => #<RSpec::Mocks::MessageExpectation #<Double "Mario">.jump(any arguments)>
Game.play(mario)
# #<Double "Mario">
expect(mario).to have_received(:jump)
# => nil
```
RSpec provides a nice `spy` method
- Instead of the above whereby we spell out the same message twice, we can do use the `spy` method
- It's also good for readability

```ruby
mario = spy('Mario')
# #<Double "Mario">
Game.play(mario)
# #<Double "Mario">
expect(mario).to have_received(:jump)
# => nil
```

### Origins: Pure, Partial and Verifying Doubles

Where do the different usage mode of test doubles come from? 

__Pure Doubles__
- Everything written so far are pure doubles
- purpose-built by rspec-mocks and consist entirely of behaviour you add to them
- can pass them into project code as if they were the real thing
- flexible and easy to get started with, best for code where you can pass in dependencies 

__Partial Doubles__
- sometimes the code you're testing doesn't give you an easy way to inject dependencies
- for example, Ruby projects call `Time.now` without providing a way to override this behaviour during testing
- to test this, we can use a partial double
- they add mocking and stubbing behavior to existing Ruby objects
- any object in your system can be a partial double
- how? `expect` or `allow` a specific message, just like you'd do for a pure double

```ruby
random = Random.new
allow(random).to receive(:rand).and_return(0.1234) # setting random to receive rand and return a specific value
random.rand 
# => 0.1234
```
Here, we're replacing random's `rand` method with one that returned a canned value

How to use partial double as a spy?
- use `to have_received` that we saw earlier.
```ruby
allow(Dir).to receive(:mktmpdir).and_yield('/path/to/tmp')
# => #<RSpec::Mocks::MessageExpectation #<Dir (class)>.mktmpdir(any arguments)>
Dir.mktmpdir { |dir| puts "Dir is: #{dir}" }
# => nil
expect(Dir).to have_received(:mktmpdir)
# => nil
```
- with partial doubles, we can only `allow` just the messages we want
- RSpec doesn't support the notion of a "partial spy"
  - because it can't spy on all of a real object's methods in a performant way.

When using partial doubles, RSpec will revert all changes at the end of each example
- in other words, the Ruby object will go back to its original behaviour
- we don't have to worry about test double behaviour leaking into other specs

- note that test doubles have short lifetime, they get torn down at end of each example
- they won't play well with RSpec features that live outside the typical per-exapmle scope, such as `before(:context)` hooks
- work around - `with_temporary_scope`

- Partial doubles are useful but considered a _code smell_
  - sign that might lead to deeper design issues. 

__Verifying doubles__

What is the downside test doubles? 
- the double and the dependency can drift out of sync with each other

What's the solution? 
- Verifying doubles can protect you from this kind of drift

What kind of false positive could happen? 
- We can create a double with a certain `method` which would then pass
- if we change the real class to have a different method name, the spec would still pass, while the real thing would not.
- How do we counter this problem before? We used `instance_double` in place of `double` and passing the name of the `Ledger` class. RSpec checks that the real `Ledger` class actually response to the `record message with the same signature. 
- Therefore, if we rename this method to `record_expense` or add or remove arguments, the specs will correctly fail

Is this a RSpec specific thing? 

Different ways RSpec gives for creating verifying doubles
- `instance_double('SomeClass')` - constraints the doule's interface using the instance methods of `SomeClass`
- `class_double('SomeClass')` - constraints the double's interface using the class methods of `SomeClass`
- `object_double(some_object)` - constraints the double's interface using the methods of `some_object` rather than a class, handy for dynamic objects that use `method_missing`
- each of these has a `_spy` variant as a convenice for using a verifying double as a spy

**Stubbed constants**

What is it?
- replace a constant with a different one for the duration of one example
- for examplme, password hashing algorithms are slow by design for security purposes
  - but we may want to speed them up during testing.
  - `bcrypt` take a tunable cost factor to specify how expensive the hash computation will be.
  - we can redefine this to `1` for testing purposes usign stubbed constant.
  - `stub_const('PasswordHash::COST_FACTOR', 1)`  

What can we use `stub_const` for? 
- Define a new constant
- replace an existing constant
- replace an entire module or class (because they are also constants)
- avoid loading an expensive class, using a lightweight fake in its place

#### Questions to clarify? 

- Are all these techniques a standard across all languages? 
- Knowing what to use? 
- Wrapper for Stripe? email services? 

