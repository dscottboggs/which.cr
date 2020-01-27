# which.cr
Adds the `which` command to Crystal code.

That is, when given an executable name, returns the absolute path to the executable.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     which.cr:
       github: dscottboggs/which.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "which"

which "bash"           # => Path["/bin/bash"]
which? "fake-command"  # => nil
```

## Development

Optimization or cross-platform suggestions are welcome. Feel free to open a pull request or issue.

## Contributing

1. Fork it (<https://github.com/dscottboggs/which.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [D. Scott Boggs](https://github.com/dscottboggs) - creator and maintainer
