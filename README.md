# Radiko

radiko.jp recorder

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'radiko', github: 'kateinoigakukun/radiko-ruby'
```

And then execute:

    $ bundle

## Usage

```ruby
require 'radiko'
client = Radiko::Client.new
# client.record <channel id>, <duration(s)>, <output path>
client.record 'QRR', 600, 'output.mp3'

# client.download <channel id>, <start>, <end>, <output file>
client.download 'QRR', '20170724003000', '20170724010000', 'output.mp3'
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

