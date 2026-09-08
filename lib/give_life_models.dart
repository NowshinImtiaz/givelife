import 'package:flutter/material.dart';

class Hospital {
  String name;
  String address;
  String distance;
  String openingTime;

  Hospital({
    required this.name,
    required this.address,
    required this.distance,
    required this.openingTime,
  });
}

class Appointment {
  DateTime date;
  TimeOfDay time;

  Appointment({
    required this.date,
    required this.time,
  });
}

class DonationRecord {
  String hospitalName;
  String bloodGroup;
  int units;
  DateTime donationDate;

  DonationRecord({
    required this.hospitalName,
    required this.bloodGroup,
    required this.units,
    required this.donationDate,
  });
}

class BloodRequest {
  String patientName;
  String bloodGroup;
  String hospitalName;
  String urgency;
  int units;
  double latitude;
  double longitude;
  double distanceInKm;

  BloodRequest({
    required this.patientName,
    required this.bloodGroup,
    required this.hospitalName,
    required this.urgency,
    required this.units,
    required this.latitude,
    required this.longitude,
    this.distanceInKm = 0,
  });
}
