class UserLocation{
  final String city;
  final String state;
  final String country;
  final String postCode;  
  final LocationStreet street;
  final LocationCoordinate coordinates;  
  final LocationTimezone timezone;
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postCode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });
}

class LocationCoordinate{
  final String latitude;
  final String longitude;
  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });
}

class LocationTimezone{
  final String offset;
  final String description;
  LocationTimezone({
    required this.offset,
    required this.description
  });
}

class LocationStreet{
  final int number;
  final String name;
  LocationStreet({
    required this.name,
    required this.number
  });
}
