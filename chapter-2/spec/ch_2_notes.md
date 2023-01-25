### What does Chapter 2 cover? 
- How to see specs' output printed as documentation
- To run a specific set of examples - to focus on one part of the program at a time
- fix a bug and rerun just the specs that failed last time
- mark work in progress to remind yourself to finish something later

### What tools make the activities above possible? 
- RSpec's spec runner. It decides which specs to run and when to run them

### What is `context` block? 
- It's an alias for describe. 

### When should we use `context` block? 
- For phrases that modify the object we're testing. 
- e.g "with milk" modifies "a cup of coffee".

### How to use RSpec's built-in documentation formatter? 
- Run `rspec --format documentation` or `rspec -f d`

### What to do if you need more details in your test report? 
- You use a different formatter.

### What does a formatter do?
- A formatter receives event from RSpec, and then reports the results. 
- Key point, under the hood, it's just a plain ruby object. 
- Formatters can write data in any format and send the output anywhere. 

### What is the point of using document formatter?
- If written example descriptions with legible output in mind, the result will read almost like project documentation

### Note about document formatter
- `contect` create additional nesting. e.g with milk example is indented further

### What does `coderay` do?
- specs' output will be color-coded 
- `code` will be highlighted with Ruby syntax highlighting.
- RSpec will automatically use CodeRay if it's available.

### How can we identify slow examples? 
- Run `rspec --profile 2`
- the number at the end is an option to see x slowest examples

### Why is it useful to identify slow examples?
- To optimise/refactor the test such that it doesn't take too long anymore

### How can we tell RSpec to run only specs that we want it to run? 
- `rspec spec/unit`
- `rspec spec/unit/specific_spec.rb`
- `rspec spec/unit spec/smoke`
- `rspec spec/unit spec/foo_spec.rb`

### How do you run examples by name?
- `rspec -e milk -fd`
- `rspec --example milk -fd`
- How does it work - RSpec searhed the full description of each example, searches are case-sensitive`

### How to run a specific single example e.g the last failure?
- Use the link provided in failed examples e.g `rspec ./spec/coffee_spec.rb:25`
- `rspec` following by file name and line of example to run.

### RSpec plugin for VSCode? 
??

### How do you re-run everything that failed?
- `rspec --only-failures`
- must set some configuration as per RSpec's instruction which will set a text file that records passing and failing test. 
- if we changed the test to pass, RSpec will still run if we run `rspec --only-failures` and once it passes, RSpec will not run it anymore.

### What does `--next-failure` command option do? 
- ??? 

### How to focus on specific examples? 
- Add an f to the beginning on RSpec method name
- `context` => `fcontext`
- `it` => `fit`
- `describe` => `fdescribe`
- set configuration to run just the focused examples. 

```ruby
RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
end
```

### If we see this line, what does this line mean in RSpec `​Run options: include {:focus=>true}`? 
- We see this when running focus examples only. 

### What does this mean `Run options: include {:last_run_status=>"failed"}`
- RSpec is running examples that failed in the last run only. 
- Happens when we run `rspec --only-failures`

### `fcontext 'with milk do'` is the shorthand of .... 
- `context 'with milk', focus: true do`
- the second argument being a hash, known as metadata

### How does RSpec use metadata? 
- RSpec uses metadata to indicate whether each spec passed or failed the last time it ran.

### Example of filtering examples using the `--tag` option
- `rspec --tag last_run_status:failed`

### Can we run focused examples without configuring RSpec in configure block? 
- Yes, use `rspec --tag focus`

### What is the point of using focusing? 
- To filter specs temporarily when testing
- e.g when refacoring? looknig for bugs etc

### How do we know if a spec hasn't been implemented yet? 
- RSpec will note it as #Not yet implemented

### How do we mark something as work in progress? 
- Use the keyword `pending`

### What is the difference between pending and commented out examples?
- Pending examples still run and report their failures
- This helps drive implementation

### Why should we define string representations for our objects? 
- Because some failure messages include string representations of object by calling `inspect` on it. 
- You can see a clearer test output if you have something defined. 

### What's the benefit of using `pending`? 
- RSpec lets you know when examples start passing.

### What happens when am examples marked as pending that has been implemented is executed? 
- The test suite is marked as failing until we remove pending.

## Exercise 

Follow instructures. 

Run bare `rspec` once so it can record the status of the examples; then run RSpec with the `--next-failure flag` and look at the output. How does it differ from that of the `--only-failures` technique we discussed in ​Rerunning Everything That Failed​?

- Instead of running all failed example, it runs the first failed example it finds.

Implement the `Tea` class’s `flavor` method to make it pass the first example. Now, run RSpec again with the same `--next-failure` flag. What do you see?

- It runs the next failure it finds since the last one that used to fail is now running. In otherwords we can run through failures one at a time.





