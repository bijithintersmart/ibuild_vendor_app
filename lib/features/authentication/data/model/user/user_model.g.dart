// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      avatar: json['avatar'] as String? ?? '',
      blockStatus: json['block_status'] as bool,
      status: json['status'] as String,
      id: (json['id'] as num).toInt(),
      mobile: json['mobile'] as String,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'block_status': instance.blockStatus,
      'status': instance.status,
      'id': instance.id,
      'mobile': instance.mobile,
      'email': instance.email,
      'dob': instance.dob,
    };
