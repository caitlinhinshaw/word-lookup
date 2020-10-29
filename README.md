# Word Lookup

A CLI application geared towards writers that uses the Words API to provide definitions, synonyms, antonyms, rhymes, and similar words for a given word.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'word_lookup'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install word_lookup

## Usage

TODO: Write usage instructions here

Word Lookup makes use of the [dotenv](https://github.com/bkeepers/dotenv)
gem to keep private variables safe. To run it locally, you'll need to provide
your own API key. Just replace `ENV['WORDS_API_KEY']` in the API call with your
own key from the Words API.

If you'd prefer to make use of the dotenv gem yourself, follow these steps:

1. Make a file called simply `.env` in the root folder (this is the same level
   as the `bin`, `lib`,`README.md`, etc).
2. In your new `.env` file, add your private variable(s). For Word Lookup, name
   the variable `WORDS_API_KEY`. The `.env` file should look something like this:
    WORDS_API_KEY=adsfjbafkgasdfasdfgsdgadsg
3. Now the program can access your API key with `ENV['WORDS_API_KEY']` in the
   API call.
4. If you plan to upload your copy to GitHub, make sure git will ignore your
   `.env` file! In your `.gitignore` file, just add `.env` to exclude it from the upload.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/caitlinhinshaw/word_lookup>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/caitlinhinshaw/word_lookup/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WordLookup project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/caitlinhinshaw/word_lookup/blob/master/CODE_OF_CONDUCT.md).
