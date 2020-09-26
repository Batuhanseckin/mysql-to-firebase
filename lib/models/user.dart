class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profileImageLink;
  String registerDate;
  String password;
  String city;
  String isActive;
  String cityName;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.profileImageLink,
        this.registerDate,
        this.password,
        this.city,
        this.isActive,
        this.cityName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profileImageLink = json['profileImageLink'];
    registerDate = json['registerDate'];
    password = json['password'];
    city = json['city'];
    isActive = json['isActive'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['profileImageLink'] = this.profileImageLink;
    data['registerDate'] = this.registerDate;
    data['password'] = this.password;
    data['city'] = this.city;
    data['isActive'] = this.isActive;
    data['city_name'] = this.cityName;
    return data;
  }
}