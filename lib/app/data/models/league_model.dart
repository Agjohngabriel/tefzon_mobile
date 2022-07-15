import 'dart:convert';

List<LeagueModel> leagueFromJson(String str) => List<LeagueModel>.from(
    json.decode(str).map((x) => LeagueModel.fromJson(x)));

String leagueToJson(List<LeagueModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeagueModel {
  LeagueModel({
    this.id,
    this.name,
    this.participants,
    this.type,
    this.duration,
    this.start,
    this.end,
    this.status,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deletedBy,
    this.winnerType,
    this.entryFee,
    this.winningAmount,
    this.entryType,
  });

  int? id;
  String? name;
  int? participants;
  String? type;
  String? duration;
  DateTime? start;
  DateTime? end;
  String? status;
  String? code;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic deletedBy;
  String? winnerType;
  int? entryFee;
  int? winningAmount;
  String? entryType;

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        id: json["id"],
        name: json["name"],
        participants: json["participants"],
        type: json["type"],
        duration: json["duration"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        status: json["status"],
        code: json["code"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
        winnerType: json["winner_type"],
        entryFee: json["entry_fee"],
        winningAmount: json["winning_amount"],
        entryType: json["entry_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "participants": participants,
        "type": type,
        "duration": duration,
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "status": status,
        "code": code,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "deleted_by": deletedBy,
        "winner_type": winnerType,
        "entry_fee": entryFee,
        "winning_amount": winningAmount,
        "entry_type": entryType,
      };
}
