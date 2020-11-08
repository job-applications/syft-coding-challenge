
# Setup Instructions

```shell script
gem install bundler
bundle install
```

## Sanity Check Setup

To verify that everything is set up correctly, run the following command:

```bash
$ ruby sanity_test.rb
```

You should see the following output.
```bash
$ ruby sanity_test.rb
Run options: --seed 62459

# Running:

.

Finished in 0.001317s, 759.3014 runs/s, 759.3014 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

# Running Test Suite

You can run the whole test suite by running the following command:
```bash
$ bundle exec guard
```

# Implementation

The core implementation can be verified in `test/challenge_test.rb`. This shows the hypothetical setup and configuration that could be used for a given basket. The rules can be changed easily and new rules can be written.

Ideally, in production, this configuration would be built up from a configuration in a file or database. However, for demonstration purposes, I've kept it in the test file.

