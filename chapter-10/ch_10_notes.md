# Chapter 10

## Key points in Chapter 10 
- identifying the components in an expectations
  - expectation must have have at the very least a subject and a matcher
  - both of them are ruby object than is then connected by `to` and `not_to` 
- in previous RSpec, `should` was used instead of `expect`, this was problematic because the Object class was monkey patched to make this `should` work
  - now we have `should` which is an alias to `expect` and we can use depending on readability
- note that we can create our own custom matchers, to do that
  - a matcher must have `matches?` `description` and failure message? 
- expectation vs assertion
  - readibility  

Description readbility and `subject` shortcuts?
- why do we have this? - because RSpec has it's own descriptions, if the description of RSpec is sufficient such that the description in `it` would be identical, we can use RSpec's descriptions.
- caveat? - it can be very difficult to understand, therefore use only when sure that the description would be identical, this is to stop test cases from being brittle and not understandable when tests changes.

- When do we want to write our own failure message? 
  - when the in built matchers don't give us enough detail.
  - in the examples, they used http api errors could be a good place where we may want to show what is in the body etc
- Other examples toucher are `stdout` tests

### Question

#### What are the three components of an expectation? 
- a subject - the thing you're testing
- a matcher - an object that specifies what you expect to be true about the subject, and provides the pass/fail logic
- A custom failure message

#### What are these 3 parts usually glued together by? 
 - `expect` followed by `to` or `not_to
 - Why? - it reads like English? 

#### How does RSpec signal a failure? 
- By raising an exception. Other test frameworks use similar technique when an assertion fails.

