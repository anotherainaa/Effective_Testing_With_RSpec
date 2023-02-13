# Chapter 7

### Key points
- `context` vs `describe` - When to use each of them? 
- `it` vs `specify` vs `example` - When to use each of them? 
- how to set up your own tags e.g `pit` while will run `pry` for tagged examples
- how to create a module / share setup for a reusable code in example groups
- How to use hooks
  - types
    - before
    - around
    - after
  - scope
    - specify how often the code needs to run
    - e.g `:suite`, `:context` etc
- how to use helper methods and drying up setup that needs to be shared
  - sharing context
  - sharing examples

### Questions

#### Example Group stuff
- Show a code example using `describe`
- Show a code example using `context`
- Show a code example using `it`
- Show a code example using `specify`
- Show a code example using `example`
   
#### Hooks stuff
- When would you use `before` `after` `around`
- Show a code example using `before`
- Show a code example using `after`
- Show a code example using `around`
- When should we clean up a database, before or after
  - Favor after, helps with debugging
- What is an example that we used with db integration tests
  - rollback always after each example for each example tagged with db

#### Helper method stuff

#### Sharing example context for example groups
- Show a code example using `shared_context` and `include_context`
- Show a good helper method example that doesn't make you have to jump all over the place to follow the flow.
