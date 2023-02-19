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

