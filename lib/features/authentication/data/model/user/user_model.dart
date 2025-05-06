import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  @JsonKey(defaultValue: "")
  final String? avatar;
  @JsonKey(name: 'block_status')
  final bool blockStatus;
  final String status;
  final int id;
  final String mobile;
  final String? email;
  final String? dob;

  UserModel({
    required this.name,
    this.avatar,
    required this.blockStatus,
    required this.status,
    required this.id,
    required this.mobile,
    this.email,
    this.dob,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? name,
    String? avatar,
    bool? blockStatus,
    String? status,
    int? id,
    String? mobile,
    String? email,
    String? dob,
  }) {
    return UserModel(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      blockStatus: blockStatus ?? this.blockStatus,
      status: status ?? this.status,
      id: id ?? this.id,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      dob: dob ?? this.dob,
    );
  }
}
