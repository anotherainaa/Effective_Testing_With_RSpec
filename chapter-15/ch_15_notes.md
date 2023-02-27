# Chapter 15

This chapter talks about how to use test doubles effectively, based on what we've learned in the previous two chapters. 

Problems we can run into

- code that passes the tests but fails in production, because the test doubles don't behave enough like the real thing
- brittle tests that fail after a refactoring, even though the new code is working correctly
- do-nothing tests that only end up checking your doubles

--- 

## Configuring test environment

- How much behavior to fake?
- example given
  - password length example
  - we get the min from the original, but we change the behavior to return a specific value? 

## Stubject

- stubject code smell
- email example
  - in the first case, we're stubbing the delivery method
  - and then we're testing the code with the stubject
  - to combat this, we refactor delivery to its own email sender
  - the email sender is turned into a double
  - and then the daily summary can be tested as it is. 
  - the boundaries are clearer.

## Using Partial Doubles Effectively

- example, something about accidentally charging cards
- use entirely fake object
- when needing to mix real and fake, consider splitting it into multiple objects
- have safety checks


## Connecting the Test Subject to Its Environment

Techniques
- etc
- depedency injection

## The Risks of Mocking Third-Party Code

Only mock objects you own. Why? 

clear risks: 
- test that fail when they sholdn't
- or test that pass when they shouldnt'

Solutions
- write your own wrapper around the API, and use a test double in place of your wrapper 
- high-fidelity fake

## High-Fidelity Fakes

- VCR, library that records requiest to the real API and response
- test runs will use the recorded data instead of making real API calls

## Faking I/O with StringIO

## Wrapping a Third-Party Dependency

