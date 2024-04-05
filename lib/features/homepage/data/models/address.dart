class Address {
  int? id;
  String? street;
  String? streetName;
  String? buildingNumber;
  String? city;
  String? zipcode;
  String? country;
  String? countyCode;
  double? latitude;
  double? longitude;

  Address(
      {this.id,
      this.street,
      this.streetName,
      this.buildingNumber,
      this.city,
      this.zipcode,
      this.country,
      this.countyCode,
      this.latitude,
      this.longitude});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    streetName = json['streetName'];
    buildingNumber = json['buildingNumber'];
    city = json['city'];
    zipcode = json['zipcode'];
    country = json['country'];
    countyCode = json['county_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['streetName'] = this.streetName;
    data['buildingNumber'] = this.buildingNumber;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['country'] = this.country;
    data['county_code'] = this.countyCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
