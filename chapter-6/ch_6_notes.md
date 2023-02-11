# Chapter 6

- Using `sequel` to set up a development, production and test databse
- Testing code with a test database
- First part is about how to set up the config, how to make the database read from test, development and production database
- Then, we set migrations and discuss how to set up the migration to run automatically
- Where do we put code setting up database migrations?
  - RSpec convention is `spec/support`

#### Keywords / Key points
- How to set up a database 
- How to set up migrations to run automatically
- RSpec conventions
- using suite-level hooks
- spec suite should set up the test database for you (rather than requiring you to run a separate setup)
  - why? because people testing the code may easily forget to run the extra step, or might not even know they need to
- matcher `be_success` to be covered in Dynamic predicates
- matcher `match [a_hash_including(...)]` - composable matches; we're passing the `a_hash_including` matched into the `match` one 
- TDD practice - normally, each example should only have one expectation in it, otherwise, one failure can mask another.
  - tradeoff - spec that touches the database is going to be ALOT slower, particularly in its setup and teardown steps
  - following "one expectation per example" too rigorously means setting up and tearing gown many times (which will take a lot of time)
- by default, RSpec aborts the test on the first failure


