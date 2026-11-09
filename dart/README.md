# Meteorite Landings API - Dart/Flutter Client

Meteorite Landings searches recorded meteor strikes by specimen name and minimum mass. Each record includes the official specimen name, meteorite classification, mass in grams, and the recorded fall year.

[![pub package](https://img.shields.io/pub/v/apiverve_meteorites.svg)](https://pub.dev/packages/apiverve_meteorites)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Meteorite Landings API](https://apiverve.com/marketplace/meteorites?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_meteorites: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_meteorites/apiverve_meteorites.dart';

void main() async {
  final client = MeteoritesClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'name': 'Allende',
      'mass': 100,
      'year': 1969
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Meteorite Landings API](https://apiverve.com/marketplace/meteorites?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/meteorites](https://docs.apiverve.com/ref/meteorites?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
