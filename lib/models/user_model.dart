class UserModel {
  int id;
  String username;
  String email;
  String isVehicle;
  String work;
  String vehicleNumber;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.isVehicle,
    required this.work,
    required this.vehicleNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      isVehicle: json['isVehicle'],
      work: json['work'],
      vehicleNumber: json['vehicle_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'isVehicle': isVehicle,
      'work': work,
      'vehicleNumber': vehicleNumber,
    };
  }
}
