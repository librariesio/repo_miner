# RepoMiner

RepoMiner is a ruby library designed to mine time sensitive information from git repositories. Things like:

- When dependencies are added/updated/removed
- When license information changes
- Changes in frequency of commits over time
- Changes in timezones of commits over time

This is a new and incomplete project that's under active development.

I'll be live streaming some of the development of this project on twitch: https://www.twitch.tv/andrew_nesbitt

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'repo_miner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install repo_miner

## Usage

Make a new repository:

```ruby
repository = RepoMiner::Repository.new('/path/to/git/repo')
```

Analyse all commits for a given branch:

```ruby
commits = repository.analyse('master')
```

See mined dependency data for a given commit:

```ruby
commits.last #=> RepoMiner::Commit:0x007fd87fdf1150(message: "Fixes 1597", sha: c656e48ada19c6c83f7705893f0a73cfc1844abf, data: {:email=>{:committer=>"andrewnez@gmail.com", :author=>"andrewnez@gmail.com"}, :dependencies=>{:added_manifests=>[], :modified_manifests=>[{:path=>"Gemfile", :platform=>"rubygems", :added_dependencies=>[], :modified_dependencies=>[], :removed_dependencies=>[{:name=>"sass", :requirement=>"= 3.4.24", :type=>:runtime}]}, {:path=>"Gemfile.lock", :platform=>"rubygems", :added_dependencies=>[{:name=>"sass-listen", :requirement=>"4.0.0", :type=>"runtime"}], :modified_dependencies=>[{:name=>"commonmarker", :requirement=>"0.16.8", :type=>"runtime", :previous_requirement=>"0.16.7"}, {:name=>"gitlab", :requirement=>"4.2.0", :type=>"runtime", :previous_requirement=>"4.1.0"}, {:name=>"rack-cors", :requirement=>"1.0.0", :type=>"runtime", :previous_requirement=>"0.4.1"}, {:name=>"sass", :requirement=>"3.5.1", :type=>"runtime", :previous_requirement=>"3.4.24"}, {:name=>"sassc", :requirement=>"1.11.4", :type=>"runtime", :previous_requirement=>"1.11.2"}], :removed_dependencies=>[]}], :removed_manifests=>[]}})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/librariesio/repo_miner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [AGPL 3 License](https://opensource.org/licenses/AGPL-3.0).
