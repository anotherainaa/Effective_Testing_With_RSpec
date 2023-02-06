# Chapter 5

### What will we cover? 
- difference between acceptance test and unit specs
- how to use depedency injection to write flexible, testable code
- the use of test doubles / mock objects to stand in for real ones
- how to refactor your specs to keep them clean and readable

### Unit test

The common term unit testing means different things to different people—or even to the same person on different projects.

Marston, Myron; Dees, Ian. Effective Testing with RSpec 3: Build Ruby Apps with Confidence (p. 118). Pragmatic Bookshelf. Kindle Edition. 

#### Where do unit testing approaches differ? 
- Degree of isolation - whether to remove every possible dependency or to test a related group of collaborating object together. 
- Book - unit spec to refer to the fastest, most isolated set of tests for a particular project

#### How will we implement unit test in this chapter? 
- Not calling methods on the `API` class directly, but simulating HTTP requests through the `Rack::Test` interface. 
- Typically we test through it's public interface. The HTTP interface is the public interface.

---
### Configration

#### How to turn off backtrace? 
- Use `config.filter_gems_from_backtrace 'rack'`. 

#### Running tests in random order? 
- Uncomment `config.order = :random` to remove order dependencies

-- 

## Key points to check
- Read article about testing by Xavier
- Read Martin Fowler's article about unit testing
- Passing in collaborating objects instead of hard-coding them = dependency injection (DI for short)
  - nightmares for verbose Java frameworks and incomprehensible XML
  - DI in Ruby is as simple as passing an argument to a method

Advantage of DI
- explicit dependencies 
- code that's easier to reason about(no global state)
- libraries that are easier to drop into another project
- more testable code

Disadvantage in the example
- callers always have to pass in an object to record expenses 
- ideally, called should be able to just call `API.new`

Test double: mocks, stubs, and others
- a test double is an object that stands in for another one during a test
  - referred to as mocks, stubs, fakes or spies depending on how they are used.
  - RSpec supports all of them under the umbrella term of doubles.

Seam between layers
- read Gary Bernhardt's excellent "Boundaries"

- `allow` method comes from rspec-mocks : configures the test double's behaviour
  - in this case, when the caller (API class) invokes `record`, the double will return a new `RecordResult` instance indicating a successful posting.

- Test maintainability

- Refactor while green (pass all the tests first!) 
- Use the green test to refactor your code

---
Feb 2nd notes: To be re-organized

What did I learn
- How to create a double using RSpec 
  - `instance_double` and passing in the Ledger class. 
  - comes from rspec mock
- how to use RSpec to write unit tests
- how to TDD
- we're creating a double on ledger, which is a dependency injection on ???? 
  - we give this ledger as a default value to app (the ledger respresents a record of the expenses)
  - writing a double because we want to mock the behaviour without the dependency?()

---
Feb 5th notes
- What does `allow` do? 
- What does `receive` do? 
- `arrange`, `act`, `assert`
- verifying doubles - fragile mocks, a problem where specs pass when they should be failing
  - test double mimic the interface of a real object


---
Feb 6th notes
- Chapter 6 - setting up databases
