# Chapter 9

## What's covered? 
-  how to change RSpec's behaviour at the Command Line
- How to customize RSpec's output
- Where to save your commonly used command-line options
- How to configure RSpec in code
- which configuration options will be useful on your projects
--- 
## Keywords
- Environment options
- filtering options
- Output options

--- 

## Topics
Setting Command-Line Defaults

Using a Custom Formatter
- `rspec a_spec.rb --format doc`

--- 

## Questions

#### How can we configure RSpec? 
- Use `RSpec.configure` block.
  - This provides access to all configuration options. 
  - Typically used to make permanent changes
- Use command-line options
  - Provides access to some configurations
  - typically one-off settings that affect a specific `rspec` run
  - like running specs with `focus` tags etc or other custom defined configurations

#### What types of options are available with command-line figuration? 
- Environment options - to control how RSpec loads your Ruby code
- Filtering options - For running certain examples over others
- Output options - How Report looks like

#### What is one example of using environment option? 
- We are experimenting with a locally modified version of a library
- Therefore, we want RSpec to load our custom version of that library instead of the default one

#### What are the two options listed in `--help` output?
- `-I path` 
- `-r, --require PATH`
- these options are designed to match the ones for Ruby. 
- The second option makes it easy to use supporting libraries while testing
- For example, if we want to use the `byebug` debugger to troubleshoot a failing spec
  - e.g `rspec -rbyebug`
- if we want to use a library without going through Bundler or RubyGems, `-r` flag will come in handy

#### What are some filtering tags we've seen up til now?
- `--only-failure`, `--next-failure`
- `-t, --tag TAG[:value]` such as `:fast`

#### How do we load files matching a certain pattern? 
- `-P, --pattern PATTERN`
- We can also use `--exclude-pattern PATTERN` to exclude certain patterns

#### How can we run a particular example or group? 
- `rspec path/to/a_spec.rb:37`

#### How to run a particular example? 
- `--example 'part of a description'`

#### Some examples of what output options do 
- Control where to output a file.
- Control the format of tests
- Enable full backtrace, and using colors
- Enable profiling od examples and list such as the slowest examples etc
- print the formatter output of your suite without running any examples or hooks
- enable ruby warnings

#### What do we do if we need to run custom behavior for every run? 
- Save a set of arguments as command-line defaults.
- By doing this, RSpec will run them by default for every run - but we can override them

#### How to we set defaults? 
- Save desired options in a text file at any of the following paths 
  - `~/.rspec`
    - for storing global personal preferences
    - RSpec will use it for all project on your machine
  - `./.rspec`
    - Project't root directory
    - For stadards agreed upon by team or whatever required to run the suite correctly
  - `./.rspec-local`
    - Personal preferences for that project 
    - because everyone may have their own version, exclude it from git.

#### Precedence order for settings? 
- Local options will override global ones.






