/// Response models for the Meteorite Landings API.

/// API Response wrapper.
class MeteoritesResponse {
  final String status;
  final dynamic error;
  final MeteoritesData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  MeteoritesResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory MeteoritesResponse.fromJson(Map<String, dynamic> json) => MeteoritesResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? MeteoritesData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Meteorite Landings API.

class MeteoritesData {
  num? count;
  List<String>? filteredOn;
  List<MeteoritesDataMeteorsItem>? meteors;

  MeteoritesData({
    this.count,
    this.filteredOn,
    this.meteors,
  });

  factory MeteoritesData.fromJson(Map<String, dynamic> json) => MeteoritesData(
      count: json['count'],
      filteredOn: (json['filteredOn'] as List?)?.cast<String>(),
      meteors: (json['meteors'] as List?)?.map((e) => MeteoritesDataMeteorsItem.fromJson(e)).toList(),
    );
}

class MeteoritesDataMeteorsItem {
  String? name;
  String? recclass;
  String? mass;
  String? year;
  MeteoritesDataMeteorsItemGeolocation? geolocation;

  MeteoritesDataMeteorsItem({
    this.name,
    this.recclass,
    this.mass,
    this.year,
    this.geolocation,
  });

  factory MeteoritesDataMeteorsItem.fromJson(Map<String, dynamic> json) => MeteoritesDataMeteorsItem(
      name: json['name'],
      recclass: json['recclass'],
      mass: json['mass'],
      year: json['year'],
      geolocation: json['geolocation'] != null ? MeteoritesDataMeteorsItemGeolocation.fromJson(json['geolocation']) : null,
    );
}

class MeteoritesDataMeteorsItemGeolocation {
  String? type;
  List<num>? coordinates;

  MeteoritesDataMeteorsItemGeolocation({
    this.type,
    this.coordinates,
  });

  factory MeteoritesDataMeteorsItemGeolocation.fromJson(Map<String, dynamic> json) => MeteoritesDataMeteorsItemGeolocation(
      type: json['type'],
      coordinates: (json['coordinates'] as List?)?.cast<num>(),
    );
}

class MeteoritesRequest {
  String name;
  double? mass;
  double? year;

  MeteoritesRequest({
    required this.name,
    this.mass,
    this.year,
  });

  Map<String, dynamic> toJson() => {
      'name': name,
      if (mass != null) 'mass': mass,
      if (year != null) 'year': year,
    };
}
