# Word Lookup

A CLI application geared towards writers that uses the Words API to provide definitions, synonyms, antonyms, rhymes, and similar words for a given word.

## Installation

### Dependencies

Make sure you have Ruby and the bundler gem installed on your machine.

Download or clone the repo, then navigate to the root folder and run `bundle install`
to install all other dependencies.

## Usage

### Setting Up Your API Key

Word Lookup makes use of the [dotenv](https://github.com/bkeepers/dotenv)
gem to keep private variables safe. To run it locally, you'll need to provide
your own API key.

Get your personal API key by logging into [RapidAPI](https://rapidapi.com/dpventures/api/wordsapi).

Then, replace `ENV['WORDS_API_KEY']` in the API call with your
own key from the Words API.

OR

If you'd prefer to make use of the dotenv gem yourself, follow these steps instead:

1. Make a file called `.env` in the root folder (this is the same level
   as the `bin`, `lib`,`README.md`, etc).
2. In your new `.env` file, add your private variable(s). For Word Lookup, name
   the variable `WORDS_API_KEY`. The `.env` file should look something like this:
    `WORDS_API_KEY=adsfjbafkgasdfasdfgsdgadsg`
3. Now the program can access your API key with `ENV['WORDS_API_KEY']` in the
   API call.
4. If you plan to upload your copy to GitHub or another version control site,
   make sure git will ignore your`.env` file! In your `.gitignore` file, just
   add `.env` to exclude it from the upload.

### Running the Program

Once you have your API key set up, you can run the gem with `bin/word_lookup`
while in the root folder. Follow the command line instructions to look up
information about your word of choice!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/caitlinhinshaw/word-lookup>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/caitlinhinshaw/word-lookup/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WordLookup project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/caitlinhinshaw/word-lookup/blob/master/CODE_OF_CONDUCT.md).
