# How to set an example group to random order
RSpec.describe SomeNewExampleGroup, order: :random do
  # ...
end

=begin

:aggregate failures
- changes how RSpec react to failure so that each example runs to completion

:pending
- indicates that you expect the example to fail

:skip
- skip the example entirely but still list the example in the output 
(unlike filtering which omits the example)

:order
- sets the order in which RSpec runs your specs
- custom ordering, e.g run in order of fastest to slowest etc


=end