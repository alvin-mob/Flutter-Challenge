class ScreenTimeModel {
  ChartData? chartData;
  String? freeTimeMaxUsage;
  DeviceUsage? deviceUsage;

  ScreenTimeModel({this.chartData, this.freeTimeMaxUsage, this.deviceUsage});

  ScreenTimeModel.fromJson(Map<String, dynamic> json) {
    chartData = json['chartData'] != null
        ? new ChartData.fromJson(json['chartData'])
        : null;
    freeTimeMaxUsage = json['freeTimeMaxUsage'];
    deviceUsage = json['deviceUsage'] != null
        ? new DeviceUsage.fromJson(json['deviceUsage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chartData != null) {
      data['chartData'] = this.chartData!.toJson();
    }
    data['freeTimeMaxUsage'] = this.freeTimeMaxUsage;
    if (this.deviceUsage != null) {
      data['deviceUsage'] = this.deviceUsage!.toJson();
    }
    return data;
  }
}

class ChartData {
  TotalTimeChart? totalTime;
  TotalTimeChart? studyTime;
  TotalTimeChart? classTime;
  TotalTimeChart? freeTime;

  ChartData({this.totalTime, this.studyTime, this.classTime, this.freeTime});

  ChartData.fromJson(Map<String, dynamic> json) {
    totalTime = json['totalTime'] != null
        ? new TotalTimeChart.fromJson(json['totalTime'])
        : null;
    studyTime = json['studyTime'] != null
        ? new TotalTimeChart.fromJson(json['studyTime'])
        : null;
    classTime = json['classTime'] != null
        ? new TotalTimeChart.fromJson(json['classTime'])
        : null;
    freeTime = json['freeTime'] != null
        ? new TotalTimeChart.fromJson(json['freeTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalTime != null) {
      data['totalTime'] = this.totalTime!.toJson();
    }
    if (this.studyTime != null) {
      data['studyTime'] = this.studyTime!.toJson();
    }
    if (this.classTime != null) {
      data['classTime'] = this.classTime!.toJson();
    }
    if (this.freeTime != null) {
      data['freeTime'] = this.freeTime!.toJson();
    }
    return data;
  }
}
class DeviceUsage{
  TotalTimeDevice? totalTime;
  TotalTimeDevice? studyTime;
  TotalTimeDevice? classTime;
  TotalTimeDevice? freeTime;

  DeviceUsage({this.totalTime, this.studyTime, this.classTime, this.freeTime});

  DeviceUsage.fromJson(Map<String, dynamic> json) {
    totalTime = json['totalTime'] != null
        ? new TotalTimeDevice.fromJson(json['totalTime'])
        : null;
    studyTime = json['studyTime'] != null
        ? new TotalTimeDevice.fromJson(json['studyTime'])
        : null;
    classTime = json['classTime'] != null
        ? new TotalTimeDevice.fromJson(json['classTime'])
        : null;
    freeTime = json['freeTime'] != null
        ? new TotalTimeDevice.fromJson(json['freeTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.totalTime != null) {
      data['totalTime'] = this.totalTime!.toJson();
    }
    if (this.studyTime != null) {
      data['studyTime'] = this.studyTime!.toJson();
    }
    if (this.classTime != null) {
      data['classTime'] = this.classTime!.toJson();
    }
    if (this.freeTime != null) {
      data['freeTime'] = this.freeTime!.toJson();
    }
    return data;
  }
}

class TotalTimeChart {
  String? total;

  TotalTimeChart({this.total});

  TotalTimeChart.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = total;
    return data;
  }
}

class TotalTimeDevice {
  String? mobile;
  String? laptop;

  TotalTimeDevice({this.mobile, this.laptop});

  TotalTimeDevice.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    laptop = json['laptop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = mobile;
    data['laptop'] = laptop;
    return data;
  }
}