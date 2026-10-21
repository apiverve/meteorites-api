# Meteorite Landings API - Ruby Gem

Meteorite Landings searches recorded meteor strikes by specimen name and minimum mass. Each record includes the official specimen name, meteorite classification, mass in grams, and the recorded fall year.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_meteorites'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_meteorites
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_meteorites'

# Initialize the client
client = APIVerve::Meteorites::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  name: "Allende",
  mass: 100,
  year: 1969
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ name: "Allende", mass: 100, year: 1969 })
  puts response["data"]
rescue APIVerve::Meteorites::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Meteorites::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Meteorites::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "count": 1,
    "filteredOn": [
      "name"
    ],
    "meteors": [
      {
        "name": "Allende",
        "recclass": "CV3",
        "mass": "2000000",
        "year": "1969",
        "geolocation": {
          "type": "Point",
          "coordinates": [
            -105.31667,
            26.96667
          ]
        }
      }
    ]
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/meteorites?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/meteorites?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/meteorites?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
