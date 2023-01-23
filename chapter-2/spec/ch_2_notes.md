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
- How does it work - RSpec searhed the full description of each example, searches are case-sensitive





