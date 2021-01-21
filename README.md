# Pdftocsv

This library offers a tool to enable you to convert PDF files to CSV-like data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdftocsv'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install pdftocsv
```

## Usage

```ruby
file_path = 'example.pdf'
pages = Pdftocsv.parse(file_path)
```

PDF example: [example.pdf](https://github.com/kei178/pdftocsv/blob/main/spec/fixtures/files/example.pdf)

```ruby
# == Parsed data example
# pages.each do |page|
#   page.each { |rows| p rows }
# end

["Invoice"]
["DATE: [Enter date]"]
["INVOICE Invoice Number"]
["FROM:", "[Company Name]", "TO:", "[Client Name]"]
["[Email]", "[Client Email Address"]
["[Address 1]il Address", "[Address 1]"]
["[Address 2]", "[Address 2]ress 1"]
["[Phone]s 2", "[Phone] Address 2"]
["TERMS: T[Payment Terms]"]
["DUE:", "Due Datet Due Date]"]
["Item Description", "Quantity", "Price", "Amount"]
["Item1", "1.00"]
["$ 10.00", "$ 10.00"]
["Item2", "2.00"]
["$ 10.00", "$ 20.00"]
["Item3"]
["1.00", "$ 20.00", "$ 20.00"]
["Item4", "5.00"]
["$ 5.00", "$ 25.00"]
["Item5", "1.00"]
["$ 8.00", "$ 8.00"]
["$ 0.00"]
["$ 0.00"]
["$ 0.00"]
["$ 0.00"]
["$ 0.00"]
["Subtotal", "$ 83.00"]
["Tax"]
["BALANCE DUE", "$ 83.00"]
["Notes"]
["EClick here to add notes or terms of service.here"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kei178/pdftocsv. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kei178/pdftocsv/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pdftocsv project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kei178/pdftocsv/blob/main/CODE_OF_CONDUCT.md).
