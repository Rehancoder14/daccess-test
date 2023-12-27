import 'dart:convert';

class GroupModel {
  dynamic command;
  String? activityDate;
  String? thaoughtOfDay;
  String? birthdayCard;
  String? anniversaryCard;
  String? welComeCard;
  List<dynamic>? bulkEmpSales;
  List<DailyPo>? dailyPo;
  List<ProjectStatus>? projectStatus;

  GroupModel({
    this.command,
    this.activityDate,
    this.thaoughtOfDay,
    this.birthdayCard,
    this.anniversaryCard,
    this.welComeCard,
    this.bulkEmpSales,
    this.dailyPo,
    this.projectStatus,
  });

  factory GroupModel.fromRawJson(String str) =>
      GroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        command: json["command"],
        activityDate: json["activityDate"],
        thaoughtOfDay: json["thaoughtOfDay"],
        birthdayCard: json["birthdayCard"],
        anniversaryCard: json["anniversaryCard"],
        welComeCard: json["welComeCard"],
        bulkEmpSales: json["bulkEmpSales"] == null
            ? []
            : List<dynamic>.from(json["bulkEmpSales"]!.map((x) => x)),
        dailyPo: json["dailyPO"] == null
            ? []
            : List<DailyPo>.from(
                json["dailyPO"]!.map((x) => DailyPo.fromJson(x))),
        projectStatus: json["projectStatus"] == null
            ? []
            : List<ProjectStatus>.from(
                json["projectStatus"]!.map((x) => ProjectStatus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "command": command,
        "activityDate": activityDate,
        "thaoughtOfDay": thaoughtOfDay,
        "birthdayCard": birthdayCard,
        "anniversaryCard": anniversaryCard,
        "welComeCard": welComeCard,
        "bulkEmpSales": bulkEmpSales == null
            ? []
            : List<dynamic>.from(bulkEmpSales!.map((x) => x)),
        "dailyPO": dailyPo == null
            ? []
            : List<dynamic>.from(dailyPo!.map((x) => x.toJson())),
        "projectStatus": projectStatus == null
            ? []
            : List<dynamic>.from(projectStatus!.map((x) => x.toJson())),
      };
}

class DailyPo {
  dynamic command;
  int? purchOrdAmt;
  int? poInVoiceAmt;
  String? activityDate;
  int? targetAmt;

  DailyPo({
    this.command,
    this.purchOrdAmt,
    this.poInVoiceAmt,
    this.activityDate,
    this.targetAmt,
  });

  factory DailyPo.fromRawJson(String str) => DailyPo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyPo.fromJson(Map<String, dynamic> json) => DailyPo(
        command: json["command"],
        purchOrdAmt: json["purchOrdAmt"],
        poInVoiceAmt: json["poInVoiceAmt"],
        activityDate: json["activityDate"],
        targetAmt: json["targetAmt"],
      );

  Map<String, dynamic> toJson() => {
        "command": command,
        "purchOrdAmt": purchOrdAmt,
        "poInVoiceAmt": poInVoiceAmt,
        "activityDate": activityDate,
        "targetAmt": targetAmt,
      };
}

class ProjectStatus {
  int? totalProjCount;
  int? completeProjCount;
  int? inProgressCount;
  String? financialYear;

  ProjectStatus({
    this.totalProjCount,
    this.completeProjCount,
    this.inProgressCount,
    this.financialYear,
  });

  factory ProjectStatus.fromRawJson(String str) =>
      ProjectStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProjectStatus.fromJson(Map<String, dynamic> json) => ProjectStatus(
        totalProjCount: json["totalProjCount"],
        completeProjCount: json["completeProjCount"],
        inProgressCount: json["inProgressCount"],
        financialYear: json["financialYear"],
      );

  Map<String, dynamic> toJson() => {
        "totalProjCount": totalProjCount,
        "completeProjCount": completeProjCount,
        "inProgressCount": inProgressCount,
        "financialYear": financialYear,
      };
}
