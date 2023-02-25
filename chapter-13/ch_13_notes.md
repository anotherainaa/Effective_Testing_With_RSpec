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

#### Questions to clarify? 

- Are all these techniques a standard across all languages? 
- Knowing what to use? 
- Wrapper for Stripe? email services? 
