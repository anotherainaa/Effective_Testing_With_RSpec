# Effective_Testing_With_RSpec

Repository for testing code and keeping notes about the book Effective Testing with RSpec 3

### Part 1 (Chapter 1 to 3)
- In this part, the book quickly gets the readers up to speed on how to use RSpec in a very basic way and gives a high-level overview of what we'll be learning in the book
- Covers topics such as
  - TDD in the book 
  - Basic ideas on how to write good tests

### Part 2 (Chapter 4 - 6)
- Gets reader to create an expense tracker using Sinatra and uses a TDD approach
- Note that the author tries to be generic with their testing terms
  - Unit test is testing a single atomic thing at a time
  - Testing with the database connnected is an intergration test
  - Acceptance test is when we test using the REST API 
- We start with acceptance tests and then move to unit test and then integration test
- The book also demonstrates how to use mocks to stub dependencies when testing.

### Part 3 (Chapter 7 - 9)
- Covers what is in RSpec core. 
- Explains example groups stuff -  `describe` `example` `it` are and it's aliases and how to use them well. 
- Explains hooks, the differences and when we may use each
- Exaples helper methods and when we may use each
- How to use metadata, tags examples, and run expensive configuration in certain tests only
- How to use CLI to run specs in a certain way, how to save configuration so that it is run the same every time. And also how to configure global, project based and personal custom setups
  - 3 types of options that we can control:
    - Environment options
    - filtering options
    - Output options

### Part 4 (Chapter 10 - 12)
- Covers RSpec expectations
- Componenets of expectations - what are expectations and matchers and how can we glue them together
- different types of matchers
- How to create custom matchers
