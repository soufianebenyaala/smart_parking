class Parking {
  String? id;
  String? name;
  String? adress;
  String? description;
  int? totalParkingLots;
  int? totalFreeParkingLots;
  double? latitude;
  double? longitude;
  int? parkingFees;
  String? companyId;
  String? status;

  Parking(
      {
      this.id,
      this.name,
      this.adress,
      this.description,
      this.totalParkingLots,
      this.totalFreeParkingLots,
      this.latitude,
      this.longitude,
      this.parkingFees,
      this.companyId,
      this.status,
    });

  Parking.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['Name'];
    adress = json['Adress'];
    description = json['description'];
    totalParkingLots = json['totalParkingLots'];
    totalFreeParkingLots = json['totalFreeParkingLots'];
    latitude = json['latitude'].toDouble();
    longitude = json['longitude'].toDouble();
    parkingFees = json['ParkingFees'];
    companyId = json['companyId'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Adress'] = this.adress;
    data['description'] = this.description;
    data['totalParkingLots'] = this.totalParkingLots;
    data['totalFreeParkingLots'] = this.totalFreeParkingLots;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['ParkingFees'] = this.parkingFees;
    data['companyId'] = this.companyId;
    data['Status'] = this.status;
    return data;
  }
}