class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'],
        suite = json['suite'],
        city = json['city'],
        zipcode = json['zipcode'];
}