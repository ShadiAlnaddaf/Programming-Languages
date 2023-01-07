class AvailableTimeModel {
  AvailableTimeModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory AvailableTimeModel.fromJson(Map<String, dynamic> json) => AvailableTimeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.times,
  });

  List<Time?>? times;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    times: json["times"] == null ? [] : List<Time?>.from(json["times"]!.map((x) => Time.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "times": times == null ? [] : List<dynamic>.from(times!.map((x) => x!.toJson())),
  };
}

class Time {
  Time({
    this.day,
    this.start,
    this.end,
  });

  int? day;
  int? start;
  int? end;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    day: json["day"],
    start: json["start"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "start": start,
    "end": end,
  };
}
