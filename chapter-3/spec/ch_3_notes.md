## What will we cover in Chapter 3? 
- How specs can give confience in code
- How a good test suite makes refactoring possible
- How to guide your design using specs with BDD

### What do specs do for us? 
- Creating confidence 
  - Happy path behaves the way we want it to
  - method detects and reacts to an error condition we're anticipating
  - last feature doesn't break existing code
  - measurable progress through the project
- Eliminating fear
  - simple changes can break distant parts of code that seem unrelated
  - this creates a fear of being unable to safely make changes to code
- Enabling refactoring
  - nothing is permanent, things change, test helps making changes easier
  - it's safety net against regressions.
  - also points out tightly coupled code
- Guiding design
  - it helps show the pain of a design problem early
  - fix early, cheap and east
- Sustainability
  - we get consistency productivity gains by making later features easier to add cause we're not fighting existing code
- documenting behavior
  - specs are excutable, easier to find out if something has gown stale (unlike documentation that can go out of date)
  - RSpec encourages writing examples that make great documentation (due ot is plain-spoken descriptions of behavior)
- Transforming workfloe
  - driving design from specs, transforms workflow. 
  - each run is an experiment designed to validate a hypothesis about how the code behaves

### Comparing costs vs benefits

- writing spec takes time, hence outlining several examples at one can help save time
- running entire suite takes time, it's important to use practices that keep specs fast
- a long running spec can interrupt your train of thought, instead we want to make effective use of rapid-feedback development (tests fast enough that I can hit enter and have a response before time to think, Gary Berhnhardt)
- failure by brittle specs - tackle this by describing exactly what you're looking for and no more
- overtesting - in overtested projects, the simplest change takes too long to complete
- sometimes, it's necessary to decide what not to test

### Different types of specs

- Acceptance
- Unit
- Integration

