import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class DoctorInfoModel {
  final String fullName;
  final String city;
  final String specialty;
  final int previewPrice;
  final int phoneNumber;
  final List workingDays;
  final String fromTime;
  final String toTime;
  final String address;
  final String latLong;
  final String imageUrl;
  String? doctorCode;
  DoctorInfoModel({
    required this.fullName,
    required this.city,
    required this.specialty,
    required this.previewPrice,
    required this.phoneNumber,
    required this.workingDays,
    required this.fromTime,
    required this.toTime,
    required this.address,
    required this.latLong,
    required this.imageUrl,
    this.doctorCode,
  });

  DoctorInfoModel copyWith({
    String? fullName,
    String? city,
    String? specialty,
    int? previewPrice,
    int? phoneNumber,
    List? workingDays,
    String? fromTime,
    String? toTime,
    String? address,
    String? latLong,
    String? imageUrl,
    String? doctorCode,
  }) {
    return DoctorInfoModel(
      fullName: fullName ?? this.fullName,
      city: city ?? this.city,
      specialty: specialty ?? this.specialty,
      previewPrice: previewPrice ?? this.previewPrice,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      workingDays: workingDays ?? this.workingDays,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      address: address ?? this.address,
      latLong: latLong ?? this.latLong,
      imageUrl: imageUrl ?? this.imageUrl,
      doctorCode: doctorCode ?? this.doctorCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'city': city,
      'specialty': specialty,
      'previewPrice': previewPrice,
      'phoneNumber': phoneNumber,
      'workingDays': workingDays,
      'fromTime': fromTime,
      'toTime': toTime,
      'address': address,
      'latLong': latLong,
      'imageUrl': imageUrl,
      'doctorCode': doctorCode,
    };
  }

  factory DoctorInfoModel.fromMap(Map<String, dynamic> map) {
    return DoctorInfoModel(
      fullName: map['fullName'] as String,
      city: map['city'] as String,
      specialty: map['specialty'] as String,
      previewPrice: map['previewPrice'] as int,
      phoneNumber: map['phoneNumber'] as int,
      workingDays: List.from((map['workingDays'] as List)),
      fromTime: map['fromTime'] as String,
      toTime: map['toTime'] as String,
      address: map['address'] as String,
      latLong: map['latLong'] as String,
      imageUrl: map['imageUrl'] as String,
      doctorCode: map['doctorCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorInfoModel.fromJson(String source) =>
      DoctorInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoctorInfoModel(fullName: $fullName, city: $city, specialty: $specialty, previewPrice: $previewPrice, phoneNumber: $phoneNumber, workingDays: $workingDays, fromTime: $fromTime, toTime: $toTime, address: $address, latLong: $latLong)';
  }

  @override
  bool operator ==(covariant DoctorInfoModel other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.city == city &&
        other.specialty == specialty &&
        other.previewPrice == previewPrice &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.workingDays, workingDays) &&
        other.fromTime == fromTime &&
        other.toTime == toTime &&
        other.address == address &&
        other.latLong == latLong;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        city.hashCode ^
        specialty.hashCode ^
        previewPrice.hashCode ^
        phoneNumber.hashCode ^
        workingDays.hashCode ^
        fromTime.hashCode ^
        toTime.hashCode ^
        address.hashCode ^
        latLong.hashCode;
  }
}
