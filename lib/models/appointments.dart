class Appointments {
  List<Appointment>? data;
  String? message;
  int? status;

  Appointments({this.data, this.message, this.status});

  Appointments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Appointment>[];
      json['data'].forEach((v) {
        data!.add(new Appointment.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Appointment {
  int? id;
  String? hour;
  int? statusHour;
  String? timePeriod;
  String? date;
  String? createdAt;
  String? updatedAt;

  Appointment(
      {this.id,
        this.hour,
        this.statusHour,
        this.timePeriod,
        this.date,
        this.createdAt,
        this.updatedAt});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hour = json['hour'];
    statusHour = json['status_hour'];
    timePeriod = json['time_period'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hour'] = this.hour;
    data['status_hour'] = this.statusHour;
    data['time_period'] = this.timePeriod;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class Meetings {
  List<meeting>? data;
  String? message;
  int? status;

  Meetings({this.data, this.message, this.status});

  Meetings.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <meeting>[];
      json['data'].forEach((v) {
        data!.add(new meeting.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class meeting {
  int? id;
  int? statusMeeting;
  int? investorId;
  int? userId;
  int? appointmentId;
  String? meetingDate;
  String? createdAt;
  String? updatedAt;

  meeting(
      {this.id,
        this.statusMeeting,
        this.investorId,
        this.userId,
        this.appointmentId,
        this.meetingDate,
        this.createdAt,
        this.updatedAt});

  meeting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusMeeting = json['status_meeting'];
    investorId = json['investor_id'];
    userId = json['user_id'];
    appointmentId = json['appointment_id'];
    meetingDate = json['meeting_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_meeting'] = this.statusMeeting;
    data['investor_id'] = this.investorId;
    data['user_id'] = this.userId;
    data['appointment_id'] = this.appointmentId;
    data['meeting_date'] = this.meetingDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}