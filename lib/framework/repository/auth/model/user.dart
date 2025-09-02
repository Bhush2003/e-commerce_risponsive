import 'dart:io';

import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User{
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final File image;

  const User({required this.email, required this.password,required this.userId,required this.image});

}