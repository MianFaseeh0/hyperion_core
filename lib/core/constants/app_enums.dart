import 'package:flutter/material.dart';

enum DriverAccountStatus {
  unuploaded,
  pending,
  active,
  blocked,
  suspended,
}

enum AppButtonSize {
  small,
  medium,
  large,
  extraLarge,
  extraLargeCircled,
  fullWidth,
}

extension DriverAccountStatusHelpers on DriverAccountStatus {
  String get backendValue {
    switch (this) {
      case DriverAccountStatus.unuploaded:
        return "UNUPLOADED";
      case DriverAccountStatus.pending:
        return "PENDING";
      case DriverAccountStatus.active:
        return "ACTIVE";
      case DriverAccountStatus.blocked:
        return "BLOCKED";
      case DriverAccountStatus.suspended:
        return "SUSPENDED";
    }
  }

  String get displayName {
    switch (this) {
      case DriverAccountStatus.unuploaded:
        return "Unuploaded";
      case DriverAccountStatus.pending:
        return "Pending";
      case DriverAccountStatus.active:
        return "Active";
      case DriverAccountStatus.blocked:
        return "Blocked";
      case DriverAccountStatus.suspended:
        return "Suspended";
    }
  }

  bool get canLogin => this == DriverAccountStatus.active;

  bool get isUnderReview =>
      this == DriverAccountStatus.pending || this == DriverAccountStatus.unuploaded;

  static DriverAccountStatus fromBackend(String status) {
    switch (status.toUpperCase()) {
      case "UNUPLOADED":
        return DriverAccountStatus.unuploaded;
      case "PENDING":
        return DriverAccountStatus.pending;
      case "ACTIVE":
        return DriverAccountStatus.active;
      case "BLOCKED":
        return DriverAccountStatus.blocked;
      case "SUSPENDED":
        return DriverAccountStatus.suspended;
      default:
        throw Exception("Unknown DriverAccountStatus: $status");
    }
  }
}

enum DocumentStatus {
  unuploaded,
  pending,
  rejected,
  success,
}

extension DocumentStatusHelpers on DocumentStatus {
  String get backendValue {
    switch (this) {
      case DocumentStatus.unuploaded:
        return "UNUPLOADED";
      case DocumentStatus.pending:
        return "PENDING";
      case DocumentStatus.rejected:
        return "REJECTED";
      case DocumentStatus.success:
        return "SUCCESS";
    }
  }

  String get displayName {
    switch (this) {
      case DocumentStatus.unuploaded:
        return "Unuploaded";
      case DocumentStatus.pending:
        return "Pending";
      case DocumentStatus.rejected:
        return "Rejected";
      case DocumentStatus.success:
        return "Success";
    }
  }

  Color get color {
    switch (this) {
      case DocumentStatus.unuploaded:
        return Colors.grey;
      case DocumentStatus.pending:
        return Colors.orange;
      case DocumentStatus.rejected:
        return Colors.red;
      case DocumentStatus.success:
        return Colors.green;
    }
  }

  bool get isPending => this == DocumentStatus.pending;

  bool get isSuccess => this == DocumentStatus.success;

  static DocumentStatus fromBackend(String status) {
    switch (status.toUpperCase()) {
      case "UNUPLOADED":
        return DocumentStatus.unuploaded;
      case "PENDING":
        return DocumentStatus.pending;
      case "REJECTED":
        return DocumentStatus.rejected;
      case "SUCCESS":
        return DocumentStatus.success;
      default:
        throw Exception("Unknown DocumentStatus: $status");
    }
  }
}


enum RideRoles {
  ride,
  parcel,
  cityToCity,
}

extension RideRolesHelpers on RideRoles {
  String get backendValue {
    switch (this) {
      case RideRoles.ride:
        return "RIDE";
      case RideRoles.parcel:
        return "PARCEL";
      case RideRoles.cityToCity:
        return "CITY_TO_CITY";
    }
  }

  String get displayName {
    switch (this) {
      case RideRoles.ride:
        return "Ride";
      case RideRoles.parcel:
        return "Parcel";
      case RideRoles.cityToCity:
        return "City to City";
    }
  }

  IconData get icon {
    switch (this) {
      case RideRoles.ride:
        return Icons.directions_car_outlined;
      case RideRoles.parcel:
        return Icons.local_shipping_outlined;
      case RideRoles.cityToCity:
        return Icons.map_outlined;
    }
  }

  bool get isRide => this == RideRoles.ride;

  bool get isParcel => this == RideRoles.parcel;

  bool get isCityToCity => this == RideRoles.cityToCity;

  static RideRoles fromBackend(String role) {
    switch (role.toUpperCase()) {
      case "RIDE":
        return RideRoles.ride;
      case "PARCEL":
        return RideRoles.parcel;
      case "CITY_TO_CITY":
        return RideRoles.cityToCity;
      default:
        throw Exception("Unknown RideRoles: $role");
    }
  }
}