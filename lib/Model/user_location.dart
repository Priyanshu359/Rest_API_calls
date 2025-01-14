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
  factory UserLocation.fromMap(Map<String, dynamic> json){
    final coordinates = LocationCoordinate.fromMap(json['coordinates']);
    final street = LocationStreet.fromMap(json['street']);
    final timezone = LocationTimezone.fromMap(json['timezone']);
    return UserLocation(
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postCode: json['postcode'].toString(), // Some post code are int
        street: street,
        coordinates: coordinates,
        timezone: timezone);
  }
}

class LocationCoordinate{
  final String latitude;
  final String longitude;
  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });
  factory LocationCoordinate.fromMap(Map<String, dynamic> json){
    return LocationCoordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
    
  }
}

class LocationTimezone{
  final String offset;
  final String description;
  LocationTimezone({
    required this.offset,
    required this.description
  });
  factory LocationTimezone.fromMap(Map<String, dynamic> json){
    return LocationTimezone(
      offset: json['offset'],
      description: json['description']
    );
  }
}

class LocationStreet{
  final int number;
  final String name;
  LocationStreet({
    required this.name,
    required this.number
  });
  factory LocationStreet.fromMap(Map<String, dynamic> json){
    return LocationStreet(
      name: json['name'],
      number: json['number']
    );
  }
}
