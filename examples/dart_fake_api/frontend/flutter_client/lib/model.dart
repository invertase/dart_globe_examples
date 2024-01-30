class Users {
  final List<User> data;
  final int total;
  final int limit;
  final int skip;

  Users({
    required this.data,
    required this.total,
    required this.limit,
    required this.skip,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      data: json['data'] != null
          ? json['data'].map<User>((user) => User.fromJson(user)).toList()
          : [],
      total: json['total'],
      limit: json['limit'],
      skip: json['skip'],
    );
  }
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String bio;
  final String phone;
  final String image;
  final String company;
  final String job;
  final String website;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.bio,
    required this.phone,
    required this.image,
    required this.company,
    required this.job,
    required this.website,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address: json['address'],
      bio: json['bio'],
      phone: json['phone'],
      image: json['image'],
      company: json['company'],
      job: json['job'],
      website: json['website'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
