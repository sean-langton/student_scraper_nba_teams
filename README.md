# StudentScraperNbaTeams

Hello! This CLI scrapes data from Basketball-Reference.com to provide information regarding the 30 current NBA teams on both a team-basis or
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'student_scraper_nba_teams'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install student_scraper_nba_teams

## Usage

First, run bin/setup to install dependencies
Then, run bin/nba_teams to begin the program. The program will take approximately 30-45 seconds to update date before presenting you with the main menu.

The Main Menu consist of 5 options
1. List All Teams
2. Historical Summary
3. Search By Team Name
4. Search By Season
5. Typing EXIT to Exit
Type in 1-4 or EXIT to select your option and then follow on screen prompts if necessary


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thewolfonthemountain/student_scraper_nba_teams.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
