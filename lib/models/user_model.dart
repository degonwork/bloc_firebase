import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String pic;
  final String city;
  final String country;
  final String zipCode;

  User({
    this.id,
    this.fullName = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.zipCode = '',
    this.pic = '',
  });

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? address,
    String? city,
    String? country,
    String? zipCode,
    String? pic,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
      pic: pic ?? this.pic,
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      fullName: snap['fullName'],
      email: snap['email'],
      address: snap['address'],
      city: snap['city'],
      country: snap['country'],
      zipCode: snap['zipCode'],
      pic: snap['pic'],
    );
  }

  Map<String, Object> toDocument() => {
        'fullName': fullName,
        'email': email,
        'address': address,
        'city': city,
        'country': country,
        'zipCode': zipCode,
        'pic': pic,
      };

  @override
  List<Object?> get props =>
      [id, fullName, email, address, city, country, zipCode, pic];

  static List<User> user = [
    User(
        id: "1",
        fullName: "Thanh Long",
        email: "dtlong.work@gmail.com",
        address: "Xuân Trường",
        city: "Nam Định",
        country: "Việt Nam",
        zipCode: "123456",
        pic:
            "https://scontent.fhan9-1.fna.fbcdn.net/v/t1.6435-9/117969340_689707185223454_7241282091069941817_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=cXDoezZjtHEAX9wqbpH&_nc_ht=scontent.fhan9-1.fna&oh=00_AfCFnP8deC36c6c3hn-HlqNfkUIfD5ZCXUAKQ4_5YYCE6Q&oe=63B42281")
  ];
}
