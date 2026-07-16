# Meteorite Landings API - PHP Package

Meteorites is a simple tool for getting meteorite data. It returns a list of meteorites that have fallen to Earth.

## Installation

Install via Composer:

```bash
composer require apiverve/meteorites
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Meteorites\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'name' => 'Allende',
    'mass' => 100,
    'year' => 1969
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Meteorites\Client;
use APIVerve\Meteorites\Exceptions\APIException;
use APIVerve\Meteorites\Exceptions\ValidationException;

try {
    $response = $client->execute(['name' => 'Allende', 'mass' => 100, 'year' => 1969]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/meteorites?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/meteorites?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/meteorites?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
