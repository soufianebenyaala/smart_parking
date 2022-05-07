class Reservation {
  String? Id;
  String? userId;
  int? position;
  DateTime? startingDate;
  DateTime? endingDate;
  String? parkingid;
  String? status;

  Reservation(
      {this.Id,
      this.userId,
      this.position,
      this.startingDate,
      this.endingDate,
      this.parkingid,
      this.status});

  Reservation.fromReserveJson(Map<String, dynamic> json) {
    Id = json['_id'];
    userId = json['userId'];
    position = json['position'];
    startingDate = DateTime.parse(json['startingDate'].toString());
    parkingid = json['parkingid'];
    status = json['status'];
  }
    Reservation.fromCheckOutJson(Map<String, dynamic> json) {
    Id = json['_id'];
    userId = json['userId'];
    position = json['position'];
    startingDate = DateTime.parse(json['startingDate'].toString());
    endingDate = DateTime.parse(json['endingDate'].toString());
    parkingid = json['parkingid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.Id;
    data['userId'] = this.userId;
    data['position'] = this.position;
    data['startingDate'] = this.startingDate;
    data['parkingid'] = this.parkingid;
    data['status'] = this.status;
    return data;
  }
}